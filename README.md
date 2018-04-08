# Scripts
## Scripts en Bash/Zsh

Recopilación de los scripts que he escrito a través del tiempo para resolver problemas particulares u optimizar la realización de trabajos o pequeñas tareas cotidianas.

La idea es disponer de un almacén para los scripts que he estado escribiendo, aprender en el proceso y poner a disposición de todos el código de esos scripts. Es importante que destacar que he procurado usar buenas prácticas de codificación por lo que quien estudie el código, podrá estar seguro de que el código disponible es moderno, profesional y muy ilustrativo.

## Scripts disponibles

* **[lampstart](https://github.com/3rn3st0/Scripts/blob/master/lampstart)** - Permite inicializar los servicios de Apache, PHP y/o MySQL pasándole algunos parámetros. El script puede ejecutarse sin parámetros y mostrará una ayuda sobre su uso. **¡ADVERTENCIA!** `lampstart` está diseñado para trabajar con el administrador para **SystemD**, **`systemctl`** y su uso sólo se ha probado en ArchLinux, Manjaro y ArchLabs.

* **[laradirs](https://github.com/3rn3st0/Scripts/blob/master/laradirs)** - Cambia los atributos para los directorios `storage` y  `bootstrap/cache` en un proyecto PHP/Laravel.

* **[phpextensions](https://github.com/3rn3st0/Scripts/blob/master/phpextensions)** - Instala una serie extensiones para el lenguaje PHP de forma automática (siempre olvido las cosas, así que esto me ayuda a que no me falte nada).

* **[restoretime](https://github.com/3rn3st0/Scripts/blob/master/restoretime)** - Sincroniza el reloj local con el reloj de tiempo disponible en la Web. Este script se hizo luego de que hiciera una instalación con arranque dual de Windows 7. La solución al problema se da realizando una serie de tareas en Windows, pero no están descritas aquí.

## Por hacer
- [x] ~~Crear funcionalidades genéricas que puedan usarse en todos los scripts.~~
- [ ] Optimizar el código de `laradirs`, `phpextensions` y `restoretime` para que sean compatibles con las buenas prácticas en la escritura de guines Bash/Zsh.
- [x] ~~Agregar nuevas funcionalidades a `lampstart` y a cualesquiera de los otros scripts.~~
- [ ] Crear nuevos scripts, (por supuesto!!! :stuck_out_tongue_winking_eye: :grin:)

## Aviso
Los scripts están escritos usando [Zsh](http://www.zsh.org/) como intérprete de comandos y siguiendo una gua de estilos y de buenas prácticas que me he ido estableciendo personalmete a través de los años.
