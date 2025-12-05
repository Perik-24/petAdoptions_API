using System;

namespace petAdoptions.Exceptions
{
    public class ApiException : Exception
    {
        /// <summary>Codigo de error de catálogo (ej: ERR_ALUMNO_NOT_FOUND)</summary>
        public string ErrorCode { get; }

        /// <summary>Status HTTP a devolver</summary>
        public int StatusCode { get; }

        /// <summary>Datos adicionales opcionales</summary>
        public object? Details { get; }

        public ApiException(string errorCode, string message, int statusCode = 400, object? details = null) : base(message)
        {
            ErrorCode = errorCode;
            StatusCode = statusCode;
            Details = details;
        }
    }
}
