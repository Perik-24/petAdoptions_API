using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
    // Mapea la tabla `cat_razas`
    [Table("cat_razas")]
    public class Raza
    {
        [Key]
        [Column("eCodRaza")]
        public int ECodRaza { get; set; }

        [Column("tNombre")]
        public string Nombre { get; set; }

        [Column("eCodEspecie")]
        public int? EspecieId { get; set; }
    }
}
