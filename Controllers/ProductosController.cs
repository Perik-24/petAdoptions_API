using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
using petAdoptions.DTOs;
using petAdoptions.Models;
using Microsoft.AspNetCore.Authorization;
using petAdoptions.Exceptions;

namespace petAdoptions.Controllers
{
    /// <summary>
    /// Endpoints para manejar productos.
    /// Comentarios añadidos para explicar la lógica de validación y persistencia.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class ProductosController : ControllerBase
    {
        private readonly PetDbContext _db;

        /// <summary>
        /// Constructor con inyección del DbContext
        /// </summary>
        public ProductosController(PetDbContext db)
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
            // Buscar Producto en la tabla `cat_productos` por su Id
            var producto = await _db.Producto
                .AsNoTracking() // mejora lecturas cuando no se modificará la entidad
                .FirstOrDefaultAsync(a => a.Id == id);

            if (producto == null)
                // Lanzamos una excepción del catálogo que nuestro middleware convertirá en 404
                throw ExceptionCatalog.ProductoNotFound(id);

            return Ok(new
            {
                Mascota = new
                {
                    producto.Id,
                    producto.Descripcion,
                    producto.Unidad,
                    producto.Precio,
                    // Construimos nombre completo de forma segura (omitimos nulos)
                    Nombre = string.Join(' ', new[] { producto.Nombre }.Where(x => !string.IsNullOrEmpty(x)))
                }
            });
        }
    }
}
