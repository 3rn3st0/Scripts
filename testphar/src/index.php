<?php
    $pharname = "testphar.phar";
    require_once "phar://$pharname/common.php";
    $config = parse_ini_file("config.ini");
    AppManager::run($config);
