Technical Assessment - RPA con Microsoft Graph
Este proyecto es un desarrollo RPA realizado en PIX Studio, que se conecta a la API de Microsoft Graph para subir archivos. El flujo principal está orquestado en el archivo Technical_Assesment.pixproj.
Requisitos Previos
1. Licencia de Microsoft
   - Actualmente el proyecto funciona con una licencia personal de Microsoft, lo cual limita el uso a cuentas personales.
   - Ten esto en cuenta al probar la conexión con Microsoft Graph.

2. Base de datos SQL
   - Se necesita configurar una cadena de conexión a SQL Server.
   - Antes de ejecutar el proyecto, debes correr el script SQLQueryDatabase.sql en tu base de datos para cargar la parametría previa.

3. PIX Studio
   - El proyecto fue desarrollado en PIX Studio.
   - Es necesario instalar la extensión de PIX Studio en tu navegador para ejecutar los flujos correctamente.

4. Google Forms
   - El proyecto también se conecta a un formulario en Google Forms para recolección de datos.
   - Formulario utilizado: https://forms.gle/ze9wwNn254XXLDS46
Instalación y Configuración
1. Clonar este repositorio:
   git clone https://github.com/Arima98/Technical_assessment.git

2. Configurar la cadena de conexión a tu base de datos SQL en el proyecto.

3. Ejecutar el script de parametría en SQL Server:
   Ejecutar el contenido de SQLQueryDatabase.sql en la base de datos.

4. Instalar la extensión de PIX Studio en el navegador.

5. Verificar la conexión con el formulario de Google Forms.
Ejecución
1. Abrir el proyecto en PIX Studio: Technical_Assesment.pixproj

2. Abrir el flujo principal Main.

3. Ejecutar el flujo para orquestar todo el proceso de conexión, carga de parámetros, interacción con Google Forms y subida de archivos a Microsoft Graph.
Estructura del Proyecto
Technical_Assesment.pixproj   → Proyecto principal de PIX Studio
Main                          → Orquestador principal del flujo
SQLQueryDatabase.sql          → Script para parametría en la DB
README.md                     → Documentación del proyecto
Google Form                   → Formulario utilizado para recolección de datos
Notas Importantes
- Este proyecto no funciona con cuentas corporativas debido a la licencia de Microsoft, solo con cuentas personales.
- Es imprescindible correr el script SQL antes de la primera ejecución.
- PIX Studio es la herramienta central de orquestación; asegúrate de tenerla correctamente instalada con su extensión.
- La conexión con Google Forms requiere acceso a Internet y permisos de integración.
Autor
Sergio Becerra (GitHub: https://github.com/Arima98)
