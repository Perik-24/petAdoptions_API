using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapea la tabla `cat_estados` en la base de datos
    [Table("cat_estados")]
    public class Estado
    {
        // PK -> eCodEstado
        [Key]
        [Column("eCodEstado")]
        public int Id { get; set; }

        // Clave de la materia (tClave) - campo requerido
        [Required]
        [Column("tNombre")]
        public string Nombre { get; set; } = null!;
    }
}
