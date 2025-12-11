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
    /// Endpoints para manejar movimientos.
    /// Comentarios añadidos para explicar la lógica de validación y persistencia.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class MovimientosController : ControllerBase
    {
        private readonly PetDbContext _db;

        /// <summary>
        /// Constructor con inyección del DbContext
        /// </summary>
        public MovimientosController(PetDbContext db)
        {
            // El DbContext se inyecta desde DI; se usa para consultar la BD
            _db = db;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody] MovimientoCreateDto dto)
        {
            // Validación de modelo (atributos [Required], [Range], etc.)
            if (!ModelState.IsValid)
                throw ExceptionCatalog.BadRequest("Datos inválidos");

            // Verificar existencia del producto
            var producto = await _db.Producto.FindAsync(dto.ProductoId);
            if (producto == null)
                throw ExceptionCatalog.ProductoNotFound(dto.ProductoId);

            // Verificar existencia del motivo
            var motivo = await _db.Motivo.FindAsync(dto.MotivoId);
            if (motivo == null)
                throw ExceptionCatalog.ProveedorNotFound(dto.MotivoId);

            // Verificar existencia del usuario
            var usuario = await _db.Usuarios.FindAsync(dto.UsuarioId);
            if (usuario == null)
                throw ExceptionCatalog.MarcaNotFound(dto.UsuarioId);

            // Mapear DTO a entidad
            var entidad = new Movimiento
            {
                ProductoId = dto.ProductoId,
                TipoMovimiento = dto.TipoMovimiento,
                Cantidad = dto.Cantidad,
                MotivoId = dto.MotivoId,
                OrigenDestino = dto.OrigenDestino,
                UsuarioId = dto.UsuarioId,
                Observaciones = dto.Observaciones,
                Fecha = DateTime.UtcNow.Date // asignamos fecha actual (UTC)
            };

            // Agregar y guardar cambios en la BD
            await _db.Movimiento.AddAsync(entidad);
            await _db.SaveChangesAsync();

            // Devolver 201 Created con la entidad creada
            return CreatedAtAction(nameof(Historial), new { id = entidad.Id }, entidad);
        }

        /// <summary>
        /// Retorna el historial de los movimientos.
        /// - Busca el movimiento por id (AsNoTracking para no rastrear la entidad en EF Core).
        /// - Devuelve un objeto con la información consolidada.
        /// </summary>
        /// <param name="id">Id del movimiento</param>

        [HttpGet("{id}")]
        public async Task<IActionResult> Historial(int id)
        {
            // Buscar Movimiento en la tabla `pro_movimientosinventario` por su Id
            var movimiento = await _db.Movimiento
                .AsNoTracking() // mejora lecturas cuando no se modificará la entidad
                .FirstOrDefaultAsync(a => a.Id == id);

            if (movimiento == null)
                // Lanzamos una excepción del catálogo que nuestro middleware convertirá en 404
                throw ExceptionCatalog.MovimientoNotFound(id);

            return Ok(new
            {
                Movimiento = new
                {
                    movimiento.Id,
                    movimiento.ProductoId,
                    movimiento.TipoMovimiento,
                    movimiento.Cantidad,
                    movimiento.MotivoId,
                    movimiento.OrigenDestino,
                    movimiento.UsuarioId,
                    movimiento.Observaciones,
                    movimiento.Fecha,
                }
            });
        }
    }
}
