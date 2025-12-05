using petAdoptions.Utils;
using System.Net;

namespace petAdoptions.Exceptions
{
    public class ExceptionCatalog
    {
        public static ApiException MascotaNotFound(int id) =>
            new ApiException(Constants.ErrorMascotaNotFound, $"Mascota con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException ProductoNotFound(int id) =>
            new ApiException(Constants.ErrorProductoNotFound, $"Producto con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException CategoriaProductoNotFound(int id) =>
            new ApiException(Constants.ErrorCategoriaProductoNotFound, $"CategoriaProducto con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException ProveedorNotFound(int id) =>
            new ApiException(Constants.ErrorProveedorNotFound, $"Proveedor con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException MarcaNotFound(int id) =>
            new ApiException(Constants.ErrorMarcaNotFound, $"Marca con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException DonadorNotFound(int id) =>
            new ApiException(Constants.ErrorDonadorNotFound, $"Donador con id {id} no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException UsuarioNotFound(string username) =>
            new ApiException(Constants.ErrorUsuarioNotFound, $"Usuario '{username}' no encontrado.", (int)HttpStatusCode.NotFound);

        public static ApiException Unauthorized(string reason = "No autorizado") =>
            new ApiException(Constants.ErrorUnauthorized, reason, (int)HttpStatusCode.Unauthorized);

        public static ApiException BadRequest(string message, string code = Constants.ErrorBadRequest) =>
            new ApiException(code, message, (int)HttpStatusCode.BadRequest);

        public static ApiException Internal(string? details = null) =>
            new ApiException(Constants.ErrorInternal, "Error interno del servidor.", (int)HttpStatusCode.InternalServerError, details);
    }
}
