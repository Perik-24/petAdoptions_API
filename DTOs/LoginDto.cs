using System.ComponentModel.DataAnnotations;

namespace petAdoptions.DTOs
{
    /// <summary>
    /// DTO para solicitar un token JWT de prueba.
    /// Requiere un apiKey configurado en appsettings (Authentication:TestApiKey) para emitir tokens en desarrollo.
    /// </summary>
    public class LoginDto
    {
        /// <summary>
        /// Nombre de usuario (tUsuario)
        /// </summary>
        [Required]
        public string Usuario { get; set; } = null!;

        /// <summary>
        /// ApiKey de prueba (debe coincidir con Authentication:TestApiKey en appsettings)
        /// </summary>
        [Required]
        public string ApiKey { get; set; } = null!;
    }
}
