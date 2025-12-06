using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    public class AdopcionCreateDto
    {
        /// <summary>
        /// Id de la mascota
        /// </summary>
        [Required]
        public int MascotaId { get; set; }

        /// <summary>
        /// Id del interesado
        /// </summary>
        [Required]
        public int InteresadoId { get; set; }

    }
}
