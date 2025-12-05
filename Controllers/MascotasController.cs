using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
using Microsoft.AspNetCore.Authorization;
using petAdoptions.Exceptions;

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

        /// <summary>
        /// Retorna el historial académico de un alumno: calificaciones y asistencias.
        /// - Busca el alumno por id (AsNoTracking para no rastrear la entidad en EF Core).
        /// - Consulta calificaciones y asistencias por alumno, incluyendo nombre de la materia.
        /// - Devuelve un objeto con la información consolidada.
        /// </summary>
        /// <param name="id">Id del alumno</param>
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

            // Consultar calificaciones del alumno incluyendo la relación de Materia
            // Se proyecta a un DTO anónimo para devolver solo campos necesarios
            //var especies = await _db.Especie
            //    .Where(c => c.AlumnoId == id)
            //    .Include(c => c.Materia) // incluir para poder obtener el nombre de la materia
            //    .Select(c => new
            //    {
            //        c.Id,
            //        c.Parcial,
            //        Calificacion = c.CalificacionValor,
            //        Fecha = c.Fecha,
            //        MateriaId = c.MateriaId,
            //        MateriaNombre = c.Materia != null ? c.Materia.Nombre : null
            //    })
            //    .ToListAsync();

            // Consultar asistencias del alumno, también proyectando campos relevantes
            //var razas = await _db.Raza
            //    .Where(a => a.AlumnoId == id)
            //    .Include(a => a.Materia)
            //    .Select(a => new
            //    {
            //        a.Id,
            //        Fecha = a.Fecha,
            //        Presente = a.Estatus == "A", // 'A' = presente en la BD
            //        MateriaId = a.MateriaId,
            //        MateriaNombre = a.Materia != null ? a.Materia.Nombre : null
            //    })
            //    .ToListAsync();

            // Devolver el historial consolidado: datos del mascota + listas
            return Ok(new
            {
                Mascota = new
                {
                    mascota.Id,
                    mascota.Edad,
                    mascota.Peso,
                    mascota.Enfermedad,
                    mascota.Descripcion,
                    // Construimos nombre completo de forma segura (omitimos nulos)
                    Nombre = string.Join(' ', new[] { mascota.Nombre}.Where(x => !string.IsNullOrEmpty(x)))
                }
            });
        }
    }
}
