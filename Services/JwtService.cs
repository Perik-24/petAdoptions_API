using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace petAdoptions.Services
{
    public class JwtService
    {
        private readonly IConfiguration _configuration;

        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration; // inyecta configuración para leer clave, issuer, audience
        }

        /// <summary>
        /// Genera token JWT con claims básicos: sub (id), unique_name (username)
        /// Pasos:
        /// - Leer clave/issuer/audience desde configuración (appsettings).
        /// - Crear SymmetricSecurityKey con la clave.
        /// - Crear SigningCredentials con HmacSha256.
        /// - Construir los claims mínimos y crear JwtSecurityToken.
        /// - Devolver token codificado y fecha de expiración.
        /// </summary>
        public (string token, DateTime expires) GenerateToken(int userId, string username)
        {
            // Leer configuración con valores por defecto (solo para desarrollo)
            var key = _configuration["Jwt:Key"] ?? "VerySecret_SymmetricKey_ChangeThisInProduction_UTMA2025";
            var issuer = _configuration["Jwt:Issuer"] ?? "utma";
            var audience = _configuration["Jwt:Audience"] ?? "utma_users";
            var durationMinutes = int.TryParse(_configuration["Jwt:DurationMinutes"], out var m) ? m : 120;

            // Crear la clave de seguridad y credenciales para firmar el token
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var expires = DateTime.UtcNow.AddMinutes(durationMinutes);

            // Claims: sub = subject (id), Name = username, jti = token id
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userId.ToString()),
                new Claim(ClaimTypes.Name, username),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            // Construir y serializar token
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: audience,
                claims: claims,
                expires: expires,
                signingCredentials: credentials
            );

            var encodedToken = new JwtSecurityTokenHandler().WriteToken(token);
            return (encodedToken, expires);
        }
    }
}
