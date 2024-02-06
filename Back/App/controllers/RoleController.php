<?php

namespace App\Controllers;

use App\Models\Role;
use PDOException;


class RoleController 
{

  public function createRole($name_role) {

    try {
      $role = new Role(null, $name_role);
      $role->insertWithValidation();

      echo "Le role a été crée.";

    }catch (PDOException $erreur) {

      echo "Erreur lors de la création du role : " . $erreur->getMessage();
    }
  }

  public function readRole() {

    $roles = Role::getAllRoles();

    echo "Liste des rôles : <br>";

    foreach ($roles as $role) {

      echo $role['name_role'] . "<br>";
    }
  }

  public function updateRole($id_role, $name_role) {

    try {

      $role = new Role($id_role);
      $role->name_role = $name_role;
      $role->update();

      echo "Le role a été mis à jours avec succes.";

    } catch (PDOException $erreur) {

      echo "Erreur lors de la mise a jour du role : " . $erreur->getMessage();
    }
  }

  public function deleteRole($id_role) {

    try{

      $role = new Role($id_role);
      $role->delete();

      echo "Le rolea été supprimé.";

    }catch (PDOException $erreur) {
      
      echo "Erreur lors de la suppression du rôle : " . $erreur->getMessage();
    }
  }

}