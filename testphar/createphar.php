<?php
    const UNO = 1;
    const DOS = 2;

    // Si no se envía el argumento con el nombre del archivo...
    if($argc < DOS) {
        showHelp();
    }

    // Autoriza a crear archivos .phar
    ini_set("phar.readonly", 0);

    // El .phar es el primer parámetro enviado al script
    $pharFile  = $argv[UNO] . ".phar";

    // Rutas de los fuentes y el directorio donde se creará el .phar
    $srcRoot   = getcwd() . "/src";
    $buildRoot = getcwd() . "/build";

    // Creo el objeto phar
    $phar = new Phar(
        $pharFile,
        FilesystemIterator::CURRENT_AS_FILEINFO | FilesystemIterator::KEY_AS_FILENAME,
        $pharFile
    );

    // Agrego los fuentes que me interesan al objeto phar, tratando a este
    // como si fuera una matriz asociativa. El contenido de los fuentes se
    // agrega usando file_get_contents()
    $phar["index.php"]  = file_get_contents($srcRoot . "/index.php");
    $phar["common.php"] = file_get_contents($srcRoot . "/common.php");

    $phar->setStub($phar->createDefaultStub("index.php"));
    //$phar->compress(Phar::GZ);

    copy($srcRoot . "/config.ini", $buildRoot . "/config.ini");

    //----------------------------------------------------------------------------------------------
    function showHelp() {
        echo "Aquí debe escribirse el procedimiento de ayuda\n";
        exit;
    }
