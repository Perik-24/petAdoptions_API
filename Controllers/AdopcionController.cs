using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
using petAdoptions.DTOs;
using petAdoptions.Exceptions;
using petAdoptions.Models;
using System.Linq;
using System.Threading.Tasks;

namespace petAdoptions.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class AdopcionController : ControllerBase
    {
        private readonly PetDbContext _db;

        public AdopcionController(PetDbContext context)
        {
            _db = context;
        }

        // GET: api/adopcion
        [HttpGet]
        public async Task<IActionResult> GetAdopciones()
        {
            var adopciones = await _db.Adopciones
                .Include(a => a.Interesado)
                .Include(a => a.Mascota)
                .ToListAsync();

            return Ok(adopciones);
        }

        // POST: api/adopcion
        [HttpPost]
        public async Task<IActionResult> CrearAdopcion([FromBody] AdopcionCreateDto dto)
        {
            if (dto == null) return BadRequest();

            // Solo crear adopción usando IDs existentes
            var adopcion = new Adopcion
            {
                eCodMascota = dto.eCodMascota,      // ID de mascota ya creado
                eCodInteresado = dto.eCodInteresado, // ID de interesado ya creado
                fhFecha = dto.fhFecha,
                tMotivo = dto.tMotivo
            };

            _db.Adopciones.Add(adopcion);
            await _db.SaveChangesAsync();

            return Ok(adopcion);
        }

        [HttpPost("interesado")]
        public async Task<IActionResult> CrearInteresado([FromBody] InteresadosCreateDto dto)
        {
            if (dto == null) return BadRequest();

            var interesado = new Interesado
            {
                tNombre = dto.NombreInteresado,
                tApellidoPaterno = dto.ApellidoPaterno,
                tApellidoMaterno = dto.ApellidoMaterno,
                tTelefono = dto.Telefono,
                tCorreo = dto.Correo,
                tDireccion = dto.Direccion,
                eCodCiudad = dto.eCodCiudad,
                eCodEstado = dto.eCodEstado,
                fhRegistro = DateTime.Now,
                tEstadoSolicitud = "Nuevo",
                tCodEstatus = "Activo"
            };

            _db.Interesados.Add(interesado);
            await _db.SaveChangesAsync();

            return Ok(interesado);
        }

        // GET interesados
        // GET: api/adopcion/interesados
        [HttpGet("interesados")]
        public async Task<IActionResult> GetInteresados()
        {
            try
            {
                var interesados = await _db.Interesados.ToListAsync();
                return Ok(interesados);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al obtener los interesados: {ex.Message}");
            }
        }

        // GET cita
        [HttpGet("citas")]
        public async Task<IActionResult> GetCitas()
        {
            var citas = await _db.Cita
                .Include(c => c.Mascota)
                .Include(c => c.Interesado)
                .ToListAsync();

            return Ok(citas);
        }

        // POST: api/adopcion/cita


        [HttpPost("cita")]
        public async Task<IActionResult> CrearCita([FromBody] CitasCreateDto dto)
        {
            if (dto == null) return BadRequest();

            var cita = new Cita
            {
                eCodMascota = dto.eCodMascota,
                eCodInteresado = dto.eCodInteresado,
                eCodUsuario = dto.eCodUsuario,
                fhFechaHora = dto.fhFechaHora,
                tMotivo = dto.tMotivo,
                tTipoCita = dto.tTipoCita ?? "Adopción"
            };

            _db.Cita.Add(cita);
            await _db.SaveChangesAsync();

            return Ok(cita);
        }
    }
}