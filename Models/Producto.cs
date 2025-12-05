using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
        // Mapear la clase a la tabla `cat_productos` de la base de datos
        [Table("cat_productos")]
        public class Producto
        {
            // PK: columna `eCodProducto`
            [Key]
            [Column("eCodProducto")]
            public int Id { get; set; }

            [Column("tNombre")]
            public string Nombre { get; set; }

            [Column("tDescripcion")]
            public string Descripcion { get; set; }

            [Column("eCodCategoriaProductos")]
            public int CategoriaId { get; set; }

            [Column("eCodProveedor")]
            public int ProveedorId { get; set; }

            [Column("eCodMarca")]
            public int MarcaId { get; set; }

            [Column("tUnidad")]
            public string Unidad { get; set; }

            [Column("nPrecioCompra")]
            public decimal Precio { get; set; }

            [Column("nStockMinimo")]
            public int Stock { get; set; }

            [Column("tCodEstatus")]
            public string? Estatus { get; set; }

            [Column("fRegistro")]
            public DateTime Fecha { get; set; }

    }
    }
