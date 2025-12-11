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

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] ProductoCreateDto dto)
        {
            // Validación de modelo (atributos [Required], [Range], etc.)
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia del alumno
            var categoria = await _db.CategoriaProductos.FindAsync(dto.CategoriaId);
            if (categoria == null)
                throw ExceptionCatalog.CategoriaProductoNotFound(dto.CategoriaId);

            // Verificar existencia de la materia
            var proveedor = await _db.Proveedor.FindAsync(dto.ProveedorId);
            if (proveedor == null)
                throw ExceptionCatalog.ProveedorNotFound(dto.ProveedorId);

            // Verificar existencia de la materia
            var marca = await _db.Marca.FindAsync(dto.MarcaId);
            if (marca == null)
                throw ExceptionCatalog.MarcaNotFound(dto.MarcaId);

            // Mapear DTO a entidad
            var entidad = new Producto
            {
                Nombre = dto.Nombre,
                Descripcion = dto.Descripcion,
                CategoriaId = dto.CategoriaId,
                ProveedorId = dto.ProveedorId,
                MarcaId = dto.MarcaId,
                Unidad = dto.Unidades,
                Precio = dto.PrecioCompra,
                Stock = dto.Stock,
                Estatus = "AC", // marca la fila como activa
                Fecha = DateTime.UtcNow.Date // asignamos fecha actual (UTC)
            };

            // Agregar y guardar cambios en la BD
            await _db.Producto.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 Created con la entidad creada
            return CreatedAtAction(nameof(Historial), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Retorna el historial de los productos.
        /// - Busca el producto por id (AsNoTracking para no rastrear la entidad en EF Core).
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
                Producto = new
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
