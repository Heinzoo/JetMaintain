# README

JetMaintain es una empresa que busca desarrollar una plataforma para gestionar el mantenimiento de motores de avión, reemplazando el registro en papel. El objetivo es mejorar la organización, control y seguimiento de los mantenimientos preventivos y correctivos. 

La plataforma centralizará la información, permitiendo programar y planificar los mantenimientos, controlar los insumos utilizados, registrar actividades detalladas y facilitar la comunicación con los clientes. El proyecto busca optimizar la eficiencia, reducir errores y pérdida de tiempo, y mejorar la calidad del servicio.

A continuación se detalla la lista principal de los comandos utilizados para implementar el proyecto en un entorno de desarrollo utilizando Ruby on Rails:

* rails new JetMaintain -d=postgresql
* rails g scaffold Model campos:tipo de dato
* Configura la base de datos ('user: postgres/ pass: postgres').
* rails db:migrate db:seed
* Definir las rutas en config/routes.rb.
* Define las acciones y lógica en los controladores generados.
* Desarrolla las vistas utilizando HTML y Ruby en la carpeta app/views.
* rails s: Inicia el servidor de desarrollo.
* Acceder a la aplicación en tu navegador web.
