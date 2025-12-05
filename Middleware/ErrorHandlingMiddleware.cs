using System;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using petAdoptions.Exceptions;


namespace petAdoptions.Middleware
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate _next; // siguiente middleware en la tubería
        private readonly ILogger<ErrorHandlingMiddleware> _logger; // logger para registrar errores
        private readonly IHostEnvironment _env; // entorno (Development/Production)

        public ErrorHandlingMiddleware(RequestDelegate next, ILogger<ErrorHandlingMiddleware> logger, IHostEnvironment env)
        {
            _next = next; // inyectado por DI
            _logger = logger;
            _env = env;
        }

        // Método que ASP.NET llama para cada petición
        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                // Llamar al siguiente middleware (o al endpoint si es el último)
                await _next(context);
            }
            catch (ApiException ex)
            {
                // Excepciones controladas por la aplicación (ApiException)
                _logger.LogWarning("ApiException atrapada: {Code} - {Message}", ex.ErrorCode, ex.Message);
                await HandleApiExceptionAsync(context, ex);
            }
            catch (Exception ex)
            {
                // Excepciones no controladas: registrarlas y devolver error interno
                _logger.LogError(ex, "Excepción no controlada");
                // En entorno de desarrollo incluimos detalles completos para debugging
                var apiEx = ExceptionCatalog.Internal(_env.IsDevelopment() ? ex.ToString() : null);
                await HandleApiExceptionAsync(context, apiEx);
            }
        }

        // Construye la respuesta JSON estándar a partir de ApiException
        private static async Task HandleApiExceptionAsync(HttpContext context, ApiException ex)
        {
            context.Response.ContentType = "application/json"; // siempre devolver JSON
            context.Response.StatusCode = ex.StatusCode; // usar el status provisto por ApiException

            var payload = new
            {
                code = ex.ErrorCode, // codigo de error registrado
                message = ex.Message, // mensaje amigable
                details = ex.Details // datos adicionales opcionales
            };

            // Serializar objeto a JSON y escribir al response
            var json = JsonSerializer.Serialize(payload);
            await context.Response.WriteAsync(json);
        }
    }
}
