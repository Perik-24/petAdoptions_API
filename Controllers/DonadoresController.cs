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
    /// Endpoints para consultar información de donadores.
    /// Comentarios añadidos para explicar cada paso y consulta.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class DonadoresController : ControllerBase
    {
        private readonly PetDbContext _db;

        /// <summary>
        /// Constructor con inyección del DbContext
        /// </summary>
        public DonadoresController(PetDbContext db)
        {
            // El DbContext se inyecta desde DI; se usa para consultar la BD
            _db = db;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] DonadorCreateDto dto)
        {
            // Validación de modelo (atributos [Required], [Range], etc.)
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia de la ciuadad
            var ciudad = await _db.Ciudad.FindAsync(dto.CiudadId);
            if (ciudad == null)
                throw ExceptionCatalog.CategoriaProductoNotFound(dto.CiudadId);

            // Verificar existencia del estado
            var estado = await _db.Estado.FindAsync(dto.EstadoId);
            if (estado == null)
                throw ExceptionCatalog.ProveedorNotFound(dto.EstadoId);

            // Mapear DTO a entidad
            var entidad = new Donador
            {
                Nombre = dto.Nombre,
                Apellido = dto.Apellidos,
                Correo = dto.Correo,
                Telefono = dto.Telefono,
                Tipo_Donador = dto.TipoDeDonador,
                Direccion = dto.Direccion,
                CiudadId = dto.CiudadId,
                EstadoId = dto.EstadoId,
                Codigo_Postal = dto.CodigoPostal,
                Notas = dto.Notas,
                Fecha = DateTime.UtcNow.Date, // asignamos fecha actual (UTC)
                Estatus = "AC" // marca la fila como activa
            };

            // Agregar y guardar cambios en la BD
            await _db.Donador.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 Created con la entidad creada
            return CreatedAtAction(nameof(Historial), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Retorna el historial académico de un alumno: calificaciones y asistencias.
        /// - Busca el alumno por id (AsNoTracking para no rastrear la entidad en EF Core).
        /// - Consulta calificaciones y asistencias por alumno, incluyendo nombre de la materia.
        /// - Devuelve un objeto con la información consolidada.
        /// </summary>
        /// <param name="id">Id del donador</param>
        [HttpGet("{id}")]
        public async Task<IActionResult> Historial(int id)
        {
            // Buscar Donador en la tabla `cat_donadores` por su Id
            var donador = await _db.Donador
                .AsNoTracking() // mejora lecturas cuando no se modificará la entidad
                .FirstOrDefaultAsync(a => a.Id == id);

            if (donador == null)
                // Lanzamos una excepción del catálogo que nuestro middleware convertirá en 404
                throw ExceptionCatalog.DonadorNotFound(id);


            // Devolver el historial consolidado: datos del donador + listas
            return Ok(new
            {
                Donador = new
                {
                    donador.Id,
                    donador.Correo,
                    donador.Telefono,
                    donador.Tipo_Donador,
                    donador.Direccion,
                    // Construimos nombre completo de forma segura (omitimos nulos)
                    Nombre = string.Join(' ', new[] { donador.Nombre, donador.Apellido }.Where(x => !string.IsNullOrEmpty(x)))
                }
            });
        }
    }
}
