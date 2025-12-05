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
