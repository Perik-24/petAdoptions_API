using petAdoptions.Utils;
using System.Net;

namespace petAdoptions.Exceptions
{
    public class ExceptionCatalog
    {
        public static ApiException MascotaNotFound(int id) =>
            new ApiException(Constants.ErrorMascotaNotFound, $"Mascota con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException UsuarioNotFound(string username) =>
            new ApiException(Constants.ErrorUsuarioNotFound, $"Usuario '{username}' no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException Unauthorized(string reason = "No autorizado") =>
            new ApiException(Constants.ErrorUnauthorized, reason, (int)HttpStatusCode.Unauthorized);

        public static ApiException Internal(string? details = null) =>
            new ApiException(Constants.ErrorInternal, "Error interno del servidor.", (int)HttpStatusCode.InternalServerError, details);
    }
}
