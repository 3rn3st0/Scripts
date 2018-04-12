<?php
class AppManager
{
    public static function run($config) {
         echo "La aplicación se ejecuta con la siguiente configuración...\n";
         var_dump($config);
     }
}