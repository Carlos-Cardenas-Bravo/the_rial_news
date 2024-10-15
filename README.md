
# DESARROLLO RUBY ON RAILS PARA EMPRENDIMIENTOS DE TIPO STARTUP

Desafío - Mecanismos de autenticación y control
de accesos en una aplicación web






## Autor

- [@Carlos-Cardenas-Bravo](https://github.com/Carlos-Cardenas-Bravo)


## Lógica utilizada

Se generó una app según lo indicado del tipo noticias online.

Se generaron roles dentro de los usuarios manejados con devise, de forma que el administrador (Editor) fuera el único que puede Postear las noticias, además de poder borrarlas, editarlas, comentarlas y borrar los comentarios que se hagan por los usuarios normales u otros administradores que no responda a su línea editorial.
Los usuarios normales (registrados) solo pueden ver el listado de noticias, entrar a ellas, ver los comentarios y generar nuevos comentarios, pero no pueden borrarlos ni siquiera los suyos.
Los visitantes (usuarios no registrados) solo pueden ver el listado de noticias, entrar a ellas, ver los comentarios pero no crear comentarios nuevos.
Además el Administrador puede listar todos los usuarios y cambiar el rol del que desee de usuario normal a administrador, asi como puede cambiar el rol de otro administrador a usuario normal. Lo que no puede hacer es cambiarse el mismo su rol de administrador a usuario normal.

Las claves de base de datos y Mailtrap (con el cual se probó la restitución de contraseña) se manejan con Figaro.

Para probar la app con el rol de Administrador se debe usar:

email: admin@admin.com

password: 123456

Se ocupó el framework de css Bulma para darle estilo a la aplicación.


## Versiones Utilizadas

Para tener una funcionalidad completa de la aplicación debes tener las siguientes versiones de los softwares utilizados.

`Ruby 3.3.3`

`Rails 7.2.1 `


## 🚀 About Me
I'm a human apprentice

