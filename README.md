Práctica 6 - STW
==============

Atención
--------

Es necesario ejecutar la práctica en el navegador **Mozilla Firefox**... Disculpen las molestias ;)

Objetivo
---------

En ésta práctica realizaremos el despliegue en Heroku de nuestro proyecto Piedra-Papel-Tijeras. Para ello primero debemos crearnos una cuenta en Heroku y descargarnos el Heroku Toolbelt.

Debemos disponer de un Gemfile y de un Rakefile; luego podremos introducir en consola las ordenes `heroku create` y `git push heroku master`. Para que heroku abra la aplicación no tenemos más que introducir la orden `heroku open`.

Contenido
---------

El contenido del fichero que se presenta es el siguiente:

* Gemfile
* Gemfile.lock
* README
* Rakefile
* Procfile
* config.ru
* public
	* css
	* img
	* js
* lib
	* ppt.rb
* views
	* index.haml
* test
	* tc_ppt.rb
* spec
	* ppt_spec.rb



Ejecución	
---------

Podemos ejecutar la práctica de las siguientes formas:

* Para ver el correspondiente despliegue en Heroku debemos visitar en el navegador **Mozilla Firefox** la siguiente dirección: `http://pure-refuge-8506.herokuapp.com/`

* Como en el directorio hemos específicado un Rakefile, podemos introducir en la consola el siguiente comando: `rake`. Luego con un navegador iremos a la página `localhost:9292` para visualizar el resultado.

* Si queremos ejecutar los test unitarios debemos introducir la orden: `rake test`.

* Si queremos ejecutar los test con RSpec debemos introducir el comando: `rake spec`.


#####Asignatura: Sistemas y Tecnologías Web.

|  Alumno |  Alu  |
|---------|-------|
|  Cristhian Javier García Conrado  |  alu0100499247  |















