using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
    // Mapea la tabla `pro_asistencias`
    [Table("cat_especies")]
    public class Especie
    {
        [Key]
        [Column("eCodEspecie")]
        public int ECodEspecie { get; set; }

        [Column("tNombre")]
        public string Nombre { get; set; }
    }
}
