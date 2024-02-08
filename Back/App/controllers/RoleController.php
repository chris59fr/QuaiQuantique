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

    // $name_role = $_GET['name_role']; formulaire

    try {
      $role = new Role(null, $name_role);
      $this->rolerepository->save($role);

      echo "Le role a été crée, avec id :" . $role->getIdRole();

    }catch (Throwable $erreur) {

      echo "Erreur lors de la création du role : " . $erreur->getMessage();
    }
  }

  public function readRole() {

    $roles = $this->rolerepository->getAllRoles();

    echo "Liste des rôles : <br>";

    foreach ($roles as $role) {

      echo sprintf(
        //sprintf template de chain caract %d (chiffre) %s(lettre)
        '%d - %s <br>',
        $role->getIdRole(),
        $role->getNameRole()
      );
    }
  }

  public function updateRole($id_role, $name_role) {
    //Get FIOOMULAIRE
    try {

      $role = new Role($id_role, $name_role);
      $this->rolerepository->save($role);

      echo "Le role a été mis à jours avec succes.";

    } catch (Throwable $erreur) {

      echo "Erreur lors de la mise a jour du role : " . $erreur->getMessage();
    }
  }

  public function deleteRole($id_role) {
    //GET fORMULAIRE
    try{

      $this->rolerepository->delete($id_role);

      echo "Le role a été supprimé.";

    }catch (Throwable $erreur) {
      
      echo "Erreur lors de la suppression du rôle : " . $erreur->getMessage();
    }
  }

}