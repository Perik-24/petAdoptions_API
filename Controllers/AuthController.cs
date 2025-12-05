using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
using petAdoptions.DTOs;
using petAdoptions.Services;
using petAdoptions.Exceptions;
using Microsoft.AspNetCore.Authorization;

namespace petAdoptions.Controllers
{
    /// <summary>
    /// Endpoint de autenticación para obtener tokens JWT en desarrollo.
    /// Comentarios añadidos para explicar el proceso de autenticación y emisión de token.
    /// </summary>
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly PetDbContext _db;
        private readonly JwtService _jwtService;
        private readonly IConfiguration _configuration;

        public AuthController(PetDbContext db, JwtService jwtService, IConfiguration configuration)
        {
            _db = db;
            _jwtService = jwtService;
            _configuration = configuration;
        }

        /// <summary>
        /// Obtener token JWT de prueba. Requiere el apiKey configurado en appsettings (Authentication:TestApiKey).
        /// Flujo:
        /// - Cliente envía usuario + apiKey.
        /// - Se verifica apiKey contra configuración (solo en dev).
        /// - Se busca el usuario en la BD.
        /// - Si existe, se genera un token JWT con `JwtService`.
        /// - Se retorna el token al cliente.
        /// </summary>
        /// <param name="dto">Usuario + ApiKey</param>
        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login([FromBody] LoginDto dto)
        {
            // Validación del modelo (campos requeridos)
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            // Verificar apiKey de prueba en configuración
            var configuredKey = _configuration["Authentication:TestApiKey"];
            if (string.IsNullOrEmpty(configuredKey) || dto.ApiKey != configuredKey)
                throw ExceptionCatalog.Unauthorized("ApiKey inválida para emisión de token.");

            // Buscar usuario por login
            var usuario = await _db.Usuarios.FirstOrDefaultAsync(u => u.UsuarioLogin == dto.Usuario);
            if (usuario == null)
                throw ExceptionCatalog.UsuarioNotFound(dto.Usuario);

            // Generar token y fecha de expiración
            var (token, expires) = _jwtService.GenerateToken(usuario.Id, usuario.UsuarioLogin);

            // Retornar token en DTO
            return Ok(new TokenResponseDto { Token = token, ExpiresAt = expires });
        }
    }
}
