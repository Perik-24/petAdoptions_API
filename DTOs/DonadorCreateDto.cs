using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    /// <summary>
    /// DTO para crear un donador.
    /// </summary>
    public class DonadorCreateDto
    {
        /// Nombre del producto
        [Required]
        public string Nombre { get; set; }

        /// Apellidos del donador
        [Required]
        public string Apellidos { get; set; }

        /// Correo electronico
        [Required]
        public string Correo { get; set; }

        /// Telefono 
        [Required]
        public string Telefono { get; set; }

        /// TipoDeDonador
        [Required]
        public string TipoDeDonador { get; set; }

        /// Direccion 
        [Required]
        public string Direccion { get; set; }

        /// Id de Ciudad (eCodCiudad)
        [Required]
        public int CiudadId { get; set; }

        /// Id de Estado (eCodEstado)
        [Required]
        public int EstadoId { get; set; }

        /// Codigo Postal
        [Required]
        public int CodigoPostal { get; set; }

        /// Notas
        [Required]
        public string Notas { get; set; }
    }
}
