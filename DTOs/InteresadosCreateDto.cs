using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    public class InteresadosCreateDto
    {
        public string NombreInteresado { get; set; }
        public string ApellidoPaterno { get; set; }
        public string ApellidoMaterno { get; set; }
        public string Telefono { get; set; }
        public string Correo { get; set; }
        public string Direccion { get; set; }
        public int eCodCiudad { get; set; }
        public int eCodEstado { get; set; }
        public string tEstadoSolicitud { get; set; } = "Nuevo";
    }
}
