using petAdoptions.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace petAdoptions.Models
{
    [Table("pro_citas")]
    public class Cita
    {
        [Key]
        public int eCodCita { get; set; }

        [ForeignKey("Interesado")]
        public int eCodInteresado { get; set; }
        public Interesado Interesado { get; set; }

        [ForeignKey("Mascota")]
        public int eCodMascota { get; set; }
        public Mascota Mascota { get; set; }

        public int? eCodUsuario { get; set; }
        public DateTime fhFechaHora { get; set; }
        public string tMotivo { get; set; }
        public string tTipoCita { get; set; } = "Adopción";
        public string tCodEstatus { get; set; } = "AC";
        public DateTime fhCreacion { get; set; } = DateTime.Now;
        public DateTime? fhActualizacion { get; set; }
    }
}
