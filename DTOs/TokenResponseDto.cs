namespace petAdoptions.DTOs
{
    /// <summary>
    /// Respuesta con el token JWT y su fecha de expiración.
    /// </summary>
    public class TokenResponseDto
    {
        public string Token { get; set; } = null!;
        public DateTime ExpiresAt { get; set; }
    }
}
