# petAdoptions_API
 Descripción
Este proyecto consiste en una API para gestionar adopciones de mascotas, permitiendo registrar mascotas, usuarios y solicitudes de adopción. Su objetivo es ofrecer un sistema simple, modular y escalable para administrar información relacionada con procesos de adopción.
 
 Características principales
Manejo de entidades: mascotas, adopciones, usuarios (según tu diseño interno).


Separación en capas: controladores, servicios, modelos, DTOs, middleware, utilitarios — lo que facilita mantenimiento y escalabilidad.


Configuración mediante archivos de proyecto (.csproj) y configuración (appsettings.json).


Soporte para definición de rutas HTTP mediante un archivo .http, lo que facilita pruebas manuales de endpoints.

---

## Requisitos
SDK .NET 6+ (o la versión especificada en el archivo .csproj).


Motor de base de datos (dependiendo de tu configuración en appsettings.json, como SQL Server, SQLite, etc.).


IDE recomendado: Visual Studio 2022 o VS Code con extensión C#.


## Quick start (pasos para levantar el proyecto desde cero)
1Clonar el repositorio:

 git clone https://github.com/Perik-24/petAdoptions_API.git


Abrir el proyecto en Visual Studio o VS Code.
2. Restaurar paquetes NuGet
```
dotnet restore
```

3. Preparar la base de datos
MySQL local
- Instala MySQL y crea la base de datos:
```sql
CREATE DATABASE refugiomascotas;
GRANT ALL ON refugiomascotas.* TO 'root'@'localhost' IDENTIFIED BY 'TuPass123';
FLUSH PRIVILEGES;
```
4.Configurar la base de datos en el archivo appsettings.json (cadena de conexión).
- Edita `appsettings.json` (o crea `appsettings.Development.json`) y ajusta la cadena de conexión y JWT. Ejemplo:
```json
{
  "ConnectionStrings": {
    "PetDb": "Server=localhost;Database=refugiomascotas;User=root;Password=TuPass123;"
  },
  "Jwt": {
    "Key": "ClaveMuyLargaYSuperSecreta_DePrueba_CambiaEsto",
    "Issuer": "petAdoptions",
    "Audience": "petAdoptions_users"
  },
  "Logging": { "LogLevel": { "Default": "Information" } },
  "AllowedHosts": "*"
}
```
> Nota: Program.cs usa `GetConnectionString("PetDb")`. Si no configuras, existe un fallback literal en Program.cs, pero es mejor apuntarlo a tu BD real.

5.Restaurar dependencias y compilar el proyecto:
```
dotnet restore
dotnet build
```

6.Ejecutar migraciones si tu proyecto las utiliza (EF Core):

 - Si ya hay migraciones (revisa `Data/Migrations`), aplica:
```
dotnet ef database update --project ./petAdoptions.csproj
```
- Si no hay migraciones y quieres crear la inicial:
```
dotnet ef migrations add InitialCreate --project ./petAdoptions.csproj
dotnet ef database update --project ./petAdoptions.csproj
```

7.Levantar la API:
Desde CLI:
```
 dotnet run --project ./petAdoptions.csproj
 ```

 Desde Visual Studio 2026:
- Abre el proyecto/solución (`petAdoptions.csproj`) en Visual Studio.
- Selecciona el perfil de ejecución (Project o IIS Express) y presiona F5 o Ctrl+F5.
- Asegúrate que `ASPNETCORE_ENVIRONMENT` esté en `Development` para habilitar Swagger.

8. Probar la API
Probar los endpoints usando petAdoptions.http o con herramientas como Postman o Thunder Client.` para probar manualmente los endpoints mediante peticiones HTTP.
- Si un endpoint requiere JWT: consigue token desde el endpoint de autenticación (revisa controladores) y añade:
```
Authorization: Bearer <token>
``` 

---

## Contenido
petAdoptions_API/
│  petAdoptions.csproj
│  Program.cs
│  appsettings.json
│  petAdoptions.http
│  
├── Controllers/      
├── Services/         
├── Models/           
├── DTOs/             
├── Middleware/       
├── Utils/            
├── Data/             
├── Exceptions/       
└── Properties/       

---

## Comandos útiles
- Estado git:
  ```
  git status
  ```
- Añadir y commitear:
  ```
  git add .
  git commit -m "Mensaje"
  git push origin main
  ```
- Crear y aplicar migraciones:
  ```
  dotnet ef migrations add NombreMigracion
  dotnet ef database update
  ```
- Ejecutar con puerto específico:
  ```
  DOTNET_URLS="http://localhost:5000;https://localhost:5001" dotnet run --project ./petAdoptions.csproj
  ```

---



 ## Notas sobre JWT y seguridad
- Las claves JWT están en `appsettings.json` (clave `Jwt:Key`). Para desarrollo está bien usar un valor temporal, pero en producción usa secretos (User Secrets, Azure Key Vault, variables de entorno).
- Valida que `Jwt:Issuer` y `Jwt:Audience` coincidan con lo esperado por los validadores en Program.cs.

 Tecnologías usadas
C# / .NET


Configuración con appsettings.json


Arquitectura en capas


Archivo .http para pruebas manuales


## Contribuir
Haz un fork del repositorio.


Crea una nueva rama para tu funcionalidad: feature/tu-funcionalidad.


Mantén la estructura modular (Controllers → Services → Models → etc.).


Añade ejemplos de uso o pruebas.


Haz un pull request con una descripción clara del cambio.

---

 Buenas prácticas sugeridas
Agregar ejemplos de peticiones y respuestas para cada endpoint.


Usar Swagger u OpenAPI para documentar rutas y modelos.


Mantener este README actualizado conforme crezcan las funcionalidades.

---

---

## Problemas comunes
- Conexión MySQL fallida: revisa host, puerto, usuario y contraseña; si usas Docker, asegúrate que el container está corriendo.
- Swagger no aparece: asegúrate de que el entorno es `Development`.
- `dotnet ef` no encontrado: instala la herramienta global `dotnet-ef` y agrega `Microsoft.EntityFrameworkCore.Design` al proyecto si no está.

---


