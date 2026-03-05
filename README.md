# api-karate-test
Ejecucion del proyecto de pruebas API con Karate

En el proyecto se realizo pruebas automaticas a los servicios de Signup y Login de la pagina Demoblaze utilizando Karate Framework.

Requisitos previos:

1. Tener instalado Java 19.
2. Tener instalado Maven.
3. Tener un IDE como IntelliJ IDEA o Visual Studio Code (opcional).

Pasos para ejecutar el proyecto:

1. Descargar o clonar el proyecto en el computador (karate).

2. Abrir el proyecto en el IDE o ubicarse en la carpeta del proyecto desde la terminal.

3. Verificar que Maven descargue todas las dependencias del proyecto.

4. Ejecutar las pruebas de una de las siguientes formas:

   Opcion 1 (desde el IDE):

   * Ir a la clase Java que ejecuta Karate (Runner o Test).
   * Hacer clic derecho sobre la clase.
   * Seleccionar "Run".

   Opcion 2 (desde la terminal con Maven):

   Ejecutar el siguiente comando dentro de la carpeta del proyecto:

   mvn test

5. Al ejecutar el proyecto se correran automaticamente los siguientes escenarios:

   * Crear un nuevo usuario (Signup).
   * Intentar crear un usuario ya existente.
   * Login con usuario y contrasenia correctos.
   * Login con usuario o contrasenia incorrectos.

6. Una vez terminadas las pruebas, Karate generara un reporte automatico en formato HTML.

El reporte se puede encontrar en la siguiente ruta:

target/karate-reports/karate-summary.html

Abrir este archivo en el navegador para ver el resultado de todas las pruebas ejecutadas.

