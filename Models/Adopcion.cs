using petAdoptions.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
    [Table("pro_adopciones")] // <- aquí le dices a EF Core la tabla correcta
    public class Adopcion
    {
        [Key]
        public int eCodAdopcion { get; set; }

        [ForeignKey("Mascota")]
        public int eCodMascota { get; set; }
        public Mascota Mascota { get; set; }

        [ForeignKey("Interesado")]
        public int eCodInteresado { get; set; }
        public Interesado Interesado { get; set; }

        public DateTime? fhFecha { get; set; }
        public string tMotivo { get; set; }
    }
}
