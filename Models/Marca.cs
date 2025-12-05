using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace petAdoptions.Models
{
    // Mapea la tabla `cat_marcas` en la base de datos
    [Table("cat_marcas")]
    public class Marca
    {
        // PK -> eCodMateria
        [Key]
        [Column("eCodMarca")]
        public int Id { get; set; }

        // Clave de la materia (tNombre) - campo requerido
        [Required]
        [Column("tNombre")]
        public string Nombre { get; set; } = null!;
    }
}
