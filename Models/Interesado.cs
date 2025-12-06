using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace petAdoptions.Models
{
    [Table("cat_interesados")]
    public class Interesado
    {
        [Key]
        public int eCodInteresado { get; set; }

        public string? tNombre { get; set; }
        public string? tApellidoPaterno { get; set; }
        public string? tApellidoMaterno { get; set; }
        public string? tTelefono { get; set; }
        public string? tCorreo { get; set; }
        public string? tDireccion { get; set; }

        public int? eCodCiudad { get; set; }
        public int? eCodEstado { get; set; }

        public string? tPreferenciaMascota { get; set; }
        public string? tMotivoContacto { get; set; }
        public string? tEstadoSolicitud { get; set; }
        public string? tNotas { get; set; }

        public DateTime? fhRegistro { get; set; }
        public string? tCodEstatus { get; set; }
    }
}
