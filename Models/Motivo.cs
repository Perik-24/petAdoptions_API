using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapea la tabla `cat_motivos_movimiento` en la base de datos
    [Table("cat_motivos_movimiento")]
    public class Motivo
    {
        // PK -> eCodMotivo
        [Key]
        [Column("eCodMotivo")]
        public int Id { get; set; }

        // Clave del motivo (tMotivo) - campo requerido
        [Required]
        [Column("tMotivo")]
        public string MotivoMovimiento { get; set; } = null!;
    }
}
