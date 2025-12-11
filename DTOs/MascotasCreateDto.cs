using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    public class MascotasCreateDto
    {
        /// Nombre de la mascota
        [Required]
        public string Nombre { get; set; }

        /// Edad de la mascota
        [Required]
        public int Edad { get; set; }

        /// Peso de la mascota
        [Required]
        public decimal? Peso { get; set; }

        /// Enfermedad de la mascota 
        [Required]
        public string Enfermedad { get; set; }

        /// Descripcion de la mascota
        [Required]
        public string Descripcion { get; set; }

        /// Id de la Especie (eCodEspecie)
        [Required]
        public int EspecieId { get; set; }

        /// Id de la Raza (eCodRaza)
        [Required]
        public int RazaId { get; set; }
    }
}
