<?php

namespace App\Repository;

use App\Models\Role;
use PDO;
use PDOException;

/**
 * Connection avec le methode insert etc 
 * liaison entre le model et comment il se stock
 * ici son save les  roles et les vérifies
 */

class RoleRepository extends AbstractRepository
{
  
    /**
   * Insertion d'un rôle
   */
  private function insert(Role $role) {
    
    try {

      $requetes = $this->getDBConnection()->prepare('INSERT INTO `role`(`name_role`) VALUES (:name_role) RETURNING `id_role`'); 
      $requetes->bindParam(':name_role', $role->getNameRole());
      $requetes->execute();

      $id_role = $requetes->fetch();//a teste retourne ID du role insert
      $role->setIdRole($id_role);
      
    } catch (PDOException $erreur) {
      
      echo "Erreur d'insertion : " . $erreur->getMessage();
    }
  }
  
    /**
   * Lecture d'un rôle
   */
  public function select() 
  {
    try {

      $requetes = $this->getDBConnection()->prepare('SELECT `name_role` FROM `role`');
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur de selection : " . $erreur->getMessage();
    }
  }

    /**
   * Mise à jour d'un rôle
   */
  private function update(Role $role) 
  {
    try {
      
      $requetes = $this->getDBConnection()->prepare('UPDATE `role` SET `name_role` = :name_role WHERE `id_role` = :id_role');
      $requetes->bindParam(':name_role', $role->getNameRole());
      $requetes->bindParam(':id_role', $role->getIdRole());
      $requetes->execute();


    } catch (PDOException $erreur) {

      echo "Erreur d'update : " . $erreur->getMessage();
    }

  }
  
    /**
   * Suppression d'un rôle
   */
  public function delete(int $id_role) 
  {
    try {

      $requetes = $this->getDBConnection()->prepare('DELETE FROM `role` WHERE `id_role` = :id_role');
      $requetes->bindParam(':id_role', $id_role);
      $requetes->execute();    

    } catch (PDOException $erreur){

      echo "Erreur de suppression : " . $erreur->getMessage();
    }

  }

  //methode savec passer au controller
  public function save(Role $role)
  {
    if ($role->getIdRole()) {

      $this->update($role);

    } else {

      $this->insert($role);
    }
  }

  
    /**
   * Sélection de tous les rôles
   */
  public function getAllRoles() 
  {
    try {
      
      $requetes = $this->getDBConnection()->prepare('SELECT * FROM `role`');
      $requetes->execute();

      return $requetes->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $erreur) {

      echo "Erreur lors de la récupération des rôles : " . $erreur->getMessage();
      return array(); 
    }
  }

}