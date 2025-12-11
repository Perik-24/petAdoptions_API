using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    /// <summary>
    /// DTO para crear un movimiento de producto.
    /// </summary>
    public class MovimientoCreateDto
    {
        /// Id del Producto (eCodProducto)
        [Required]
        public int ProductoId { get; set; }

        /// Tipo de Movimiento
        [Required]
        public string TipoMovimiento { get; set; }

        /// Cantidad del producto que se va a mover
        [Required]
        public int Cantidad { get; set; }

        /// Id del Motivo del Movimiento (eCodMotivo)
        [Required]
        public int MotivoId { get; set; }

        /// Destino del Movimiento
        [Required]
        public string OrigenDestino { get; set; }

        /// Id del Usuario (eCodUsuario)
        [Required]
        public int UsuarioId { get; set; }

        /// Id de Ciudad (eCodCiudad)
        [Required]
        public string Observaciones { get; set; }

    }
}
