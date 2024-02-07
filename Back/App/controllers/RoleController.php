<?php

namespace App\Controllers;

use App\Models\Role;
use PDOException;
use App\Repository\RoleRepository;
use Throwable;

class RoleController 
{
  private RoleRepository $rolerepository;

  public function __construct() {
    $this->rolerepository = new RoleRepository ;
  }

  public function createRole($name_role) {

    try {
      $role = new Role(null, $name_role);
      $this->rolerepository->save($role);

      echo "Le role a été crée.";

    }catch (Throwable $erreur) {

      echo "Erreur lors de la création du role : " . $erreur->getMessage();
    }
  }

  public function readRole() {

    $roles = $this->rolerepository->getAllRoles();

    echo "Liste des rôles : <br>";

    foreach ($roles as $role) {

      echo $role['name_role'] . "<br>";
    }
  }

  public function updateRole($id_role, $name_role) {

    try {

      $role = new Role($id_role, $name_role);
      $this->rolerepository->save($role);

      echo "Le role a été mis à jours avec succes.";

    } catch (Throwable $erreur) {

      echo "Erreur lors de la mise a jour du role : " . $erreur->getMessage();
    }
  }

  public function deleteRole($id_role) {

    try{

      $this->rolerepository->delete($id_role);

      echo "Le rolea été supprimé.";

    }catch (Throwable $erreur) {
      
      echo "Erreur lors de la suppression du rôle : " . $erreur->getMessage();
    }
  }

}