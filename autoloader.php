<?php

require_once (__DIR__ . '/Back/App/Repository/Database.php');

require_once (__DIR__ . '/Back/App/controllers/RoleController.php');
require_once (__DIR__ . '/Back/App/models/Role.php');
require_once (__DIR__ . '/Back/App/Repository/AbstractRepository.php');
require_once (__DIR__ . '/Back/App/Repository/RoleRepository.php');


// function RegisterAutoloader() {
  
//   spl_autoload_register(function($class){

//     if (file_exists(__DIR__ . '/Back/App/controllers/' .  $class . '.php')) {

//       require_once (__DIR__ . '/Back/App/controllers/' . $class . '.php');
//     }

//     if (file_exists(__DIR__ . '/Back/App/Repository/' .  $class . '.php')) {

//       require_once (__DIR__ . '/Back/App/Repository/' . $class . '.php');
//     }

//     if (file_exists(__DIR__ . '/Back/App/models/' .  $class . '.php')) {

//       require_once (__DIR__ . '/Back/App/models/' . $class . '.php');
//     }
//   });
// }
// RegisterAutoloader();