using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapear la clase a la tabla `pro_movimientosinventario` de la base de datos
    [Table("pro_movimientosinventario")]
    public class Movimiento
    {
        // PK: columna `eCodMovimiento`
        [Key]
        [Column("eCodMovimiento")]
        public int Id { get; set; }

        [Column("eCodProducto")]
        public int ProductoId { get; set; }

        [Column("tTipoMovimiento")]
        public string TipoMovimiento { get; set; }

        [Column("nCantidad")]
        public int Cantidad { get; set; }

        [Column("eCodMotivo")]
        public int MotivoId { get; set; }

        [Column("tOrigenDestino")]
        public string OrigenDestino { get; set; }

        [Column("eCodUsuario")]
        public int UsuarioId { get; set; }

        [Column("tObservaciones")]
        public string Observaciones { get; set; }

        [Column("fhFecha")]
        public DateTime Fecha { get; set; }
    }
}
