using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
using petAdoptions.DTOs;
using petAdoptions.Exceptions;
using petAdoptions.Models;
using System.Linq;
using System.Threading.Tasks;

namespace petAdoptions.Controllers
{
    /// <summary>
    /// Endpoints para consultar información de alumnos.
    /// Comentarios añadidos para explicar cada paso y consulta.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class MascotasController : ControllerBase
    {
        private readonly PetDbContext _db;

        /// <summary>
        /// Constructor con inyección del DbContext
        /// </summary>
        public MascotasController(PetDbContext db)
        {
            // El DbContext se inyecta desde DI; se usa para consultar la BD
            _db = db;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] MascotasCreateDto dto)
        {
            // Validación de modelo (atributos [Required], [Range], etc.)
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia de la especie
            var especie = await _db.Especie.FindAsync(dto.EspecieId);
            if (especie == null)
                throw ExceptionCatalog.EspecieNotFound(dto.EspecieId);

            // Verificar existencia de la raza
            var raza = await _db.Raza.FindAsync(dto.RazaId);
            if (raza == null)
                throw ExceptionCatalog.RazaNotFound(dto.RazaId);

            // Mapear DTO a entidad
            var entidad = new Mascota
            {
                Nombre = dto.Nombre,
                Edad = dto.Edad,
                Peso = dto.Peso,
                Enfermedad = dto.Enfermedad,
                Descripcion = dto.Descripcion,
                EspecieId = dto.EspecieId,
                RazaId = dto.RazaId,
                Estatus = "AC", // marca la fila como activa
                Fecha = DateTime.UtcNow.Date // asignamos fecha actual (UTC)
            };

            // Agregar y guardar cambios en la BD
            await _db.Mascota.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 Created con la entidad creada
            return CreatedAtAction(nameof(Historial), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Retorna el historial de las mascotas.
        /// - Busca la mascota por id (AsNoTracking para no rastrear la entidad en EF Core).
        /// - Devuelve un objeto con la información consolidada.
        /// </summary>
        /// <param name="id">Id de la mascota</param>
        [HttpGet("{id}")]
        public async Task<IActionResult> Historial(int id)
        {
            // Buscar Mascota en la tabla `cat_mascotas` por su Id
            var  mascota = await _db.Mascota
                .AsNoTracking() // mejora lecturas cuando no se modificará la entidad
                .FirstOrDefaultAsync(a => a.Id == id);

            if (mascota == null)
                // Lanzamos una excepción del catálogo que nuestro middleware convertirá en 404
                throw ExceptionCatalog.MascotaNotFound(id);

            // Devolver el historial consolidado: datos del mascota + listas
            return Ok(new
            {
                Mascota = new
                {
                    mascota.Id,
                    // Construimos nombre completo de forma segura (omitimos nulos)
                    Nombre = string.Join(' ', new[] { mascota.Nombre }.Where(x => !string.IsNullOrEmpty(x))),
                    mascota.Edad,
                    mascota.Peso,
                    mascota.Enfermedad,
                    mascota.Descripcion,
                    mascota.EspecieId,
                    mascota.RazaId,
                    mascota.Estatus,
                    mascota.Fecha
                }
            });
        }
    }
}
