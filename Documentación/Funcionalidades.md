# Funcionalidades implementadas

## Funcionalidades relativas a la gestión de sesiones
* ### Registro  
Los usuarios deben poder crear una cuenta en la aplicación introduciendo un nombre de usuario, correo electrónico y contraseña.
* ### Inicio de sesión  
Los usuarios ya registrados en la aplicación deben poder iniciar sesión usando su nombre de usuario y contraseña. Además, se habilitará la opción de recordar 
contraseña por el navegador.
* ### Cierre de sesión
Los usuarios que tengan su sesión iniciada deben poder cerrar sesión y salir de su cuenta de forma segura desde la aplicación.
## Funcionalidades relativas al perfil de usuario
* ### Edición de la información personal del usuario
Los usuarios registrados deben poder editar la información personal que aparece en su perfil, incluido su nombre de usuario y contraseña.
* ### Establecer una imagen de perfil
Los usuarios registrados deben poder subir una imagen a la aplicación web para que sea su foto de perfil.
* ### Editar la imagen de perfil
Los usuarios registrados que hayan establecido una imagen de perfil deben poder cambiarla por otra.
* ### Eliminar la imagen de perfil
Los usuarios registrados que hayan establecido una imagen de perfil deben poder eliminar dicha imagen y volver a usar la imagen por defecto.
* ### Ver perfiles de usuarios
Todos los usuarios podrán buscar los perfiles de usuarios concretos y ver la información personal de su dueño (excepto campos privados como la contraseña) y las listas
de cursos que haya creado. Solo los perfiles públicos aparecerán en estas búsquedas y serán visibles por usuarios distintos a su dueño.
## Funciones relativas a la privacidad del perfil
* ### Privacy by default
Por defecto los perfiles de los usuarios registrados serán privados, por lo que no aparecerán en las busquedas de otros usuarios y solo el usuario logueado podrá verlo.
* ### Perfil público
Los usuarios registrados que tengan un perfil privado deben poder hacer público su perfil. Los perfiles públicos serán visibles para otros usuarios y aparecerán en 
las búsquedas realizadas por estos.
* ### Perfil privado
Los usuarios registrados que tengan un perfil público deben poder volver a establecer su perfil como privado.
## Funcionalidades relativas a las listas de cursos
* ### Creación listas de cursos
Los usuarios registrados deben poder crear listas de cursos. Estas listas tendrán un nombre, una descripción (opcional) y un listado con los cursos añadidos por el usuario.
* ### Ver mis listas de cursos
Los usuarios logueados podrán ver la información de todas sus listas de cursos (nombre, descripción si la tienen y cursos añadidos).
* ### Edición de mis listas de cursos
Los usuarios registrados podrán editar el nombre y descripción de todas sus listas de cursos
* ### Eliminación de mis listas de cursos
Los usuarios registrados podrán eliminar sus listas de cursos de forma permanente. Dado que esta operación es irreversible debe informarse al usuario antes de 
llevarla a cabo.
* ### Ver listas de cursos
Todos los usuarios podrán ver la información de las listas de cursos de un usario si este tiene un perfil público. Las lista de cursos pertenecientes a usuarios
con un perfil privado no serán visibles por usuarios distintos a su dueño.
## Funcionalidades relativas a los cursos
* ## Ver los cursos
Todos los usuarios podrán ver la información de los diferentes cursos.
* ### Añadir cursos a un lista
Los usuarios registrados que tengan al menos una lista de cursos creada podrán añadir cursos a sus listas. Un mismo curso no podrá añadirse varias veces a la misma
lista, pero si que podrá añadirse a listas distintas del mismo usuario.
* ### Eliminar curso de una lista
Los usuarios registrados que tengan al menos una lista con cursos podrán eliminar estos cursos de la lista. Los cursos eliminados de una lista podrán volver ser
añadidos a la misma.
## Funcionalidades relativas a las páginas de error
* ### Páginas de error específicas
En caso de que se produzca un error 403 Forbidden, 404 Not Found o 500 Internal Server Error se redirigirá al usuario a una página personalizada con la información relativa al error específico. La información mostrada al usuario debe ser la justa y necesaria, nunca se mostrará información que pueda poner en peligro la seguridad de la aplicación.
