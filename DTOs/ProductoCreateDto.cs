using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    /// <summary>
    /// DTO para crear un producto.
    /// </summary>
    public class ProductoCreateDto
    {
        /// <summary>
        /// Nombre del producto
        /// </summary>
        [Required]
        public string Nombre { get; set; }

        /// <summary>
        /// Descripcion del producto
        /// </summary>
        [Required]
        public string Descripcion { get; set; }

        /// <summary>
        /// Id de la categoría del producto (eCodCategoriaProductos)
        /// </summary>
        [Required]
        public int CategoriaId { get; set; }

        /// <summary>
        /// Id de proveedor (eCodProveedor)
        /// </summary>
        [Required]
        public int ProveedorId { get; set; }

        /// <summary>
        /// Id de marca (eCodMarca)
        /// </summary>
        [Required]
        public int MarcaId { get; set; }

        /// <summary>
        /// Unidad
        /// </summary>
        [Required]
        public string Unidades { get; set; }

        /// <summary>
        /// Precio de la compra
        /// </summary>
        [Required]
        public decimal PrecioCompra { get; set; }

        /// <summary>
        /// Stock
        /// </summary>
        [Required]
        public int Stock { get; set; }
    }
}
