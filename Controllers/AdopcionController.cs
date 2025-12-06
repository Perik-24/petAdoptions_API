using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using petAdoptions.Data;
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
        public AdopcionController(PetDbContext db)
        {
            _db = db;
        }

        // GET: api/adopcion
        [HttpGet]
        public async Task<IActionResult> GetAdopciones()
        {
            var adopciones = await _db.Adopciones
    .Include(a => a.Interesado)  // <-- propiedad de navegación
    .Include(a => a.Mascota)     // <-- propiedad de navegación
    .ToListAsync();

            return Ok(adopciones);
        }

        // POST: api/adopcion
        [HttpPost]
        public async Task<IActionResult> CrearAdopcion([FromBody] Adopcion adopcion)
        {
            if (adopcion == null) return BadRequest();

            _db.Adopciones.Add(adopcion);
            await _db.SaveChangesAsync();
            return Ok(adopcion);
        }
    }
}