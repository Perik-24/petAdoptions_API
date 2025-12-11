using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    public class CitasCreateDto
    {
        public int eCodMascota { get; set; }
        public int eCodInteresado { get; set; }
        public int? eCodUsuario { get; set; }
        public DateTime fhFechaHora { get; set; } // ahora es un solo campo
        public string tMotivo { get; set; }
        public string tTipoCita { get; set; } = "Adopción"; // opcional}
    }
}
