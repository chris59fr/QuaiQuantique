<?php

namespace App\Models;

use App\config\Database;
use PDO;
use PDOException;

class Role 
{
  private $id_role;
  private $name_role;
  private $connexion;

  public function __construct($id_role = null, $name_role= null)
  {
    $this->id_role = $id_role;
    $this->name_role = $name_role;
    $this->connexion = $this->getDBConnection();
  }

    /**
   * Connexion BDD
   */
  private function getDBConnection() 
  {
    $db = Database::getInstance();
    return $db->getConnexion();
  }

    /**
   * Getter Setter pour name_role
   */
  public function getNameRole()
  {
    return $this->name_role;
  }

  public function setNameRole($name_role): self
  {
    $this->name_role = $name_role;

    return $this;
  }

    /**
   * Getter Setter pour id_role
   */
  public function getIdRole()
  {
    return $this->id_role;
  }

  public function setIdRole($id_role): self
  { 
    if ($id_role === null) {

      $this->insert();

    } else {

      $this->update();

    }
    $this->id_role = $id_role;

    return $this;
  }
  


    /**
   * Insertion d'un rôle
   */
  public function insert() {

    try {
      $this->validateName();
      $requetes = $this->connexion->prepare('INSERT INTO `role`(`name_role`) VALUES (:name_role)');      
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->execute();

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

      $requetes = $this->connexion->prepare('SELECT `name_role` FROM `role`');
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur de selection : " . $erreur->getMessage();
    }
  }

    /**
   * Mise à jour d'un rôle
   */
  public function update() 
  {
    try {
      
      $requetes = $this->connexion->prepare('UPDATE `role` SET `name_role` = :name_role WHERE `id_role` = :id_role');
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur d'update : " . $erreur->getMessage();
    }
  }
  
    /**
   * Suppression d'un rôle
   */
  public function delete() 
  {

    try {

      $requetes = $this->connexion->prepare('DELETE FROM `role` WHERE `id_role` = :id_role');
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();    

    } catch (PDOException $erreur){

      echo "Erreur de suppression : " . $erreur->getMessage();
    }

  }

    /**
   * Validation du nom de rôle
   */
  public function validateName() 
  {
    if (strlen($this->name_role) < 3) {
      throw new PDOException("Le nom du rôle doit cmporter au moins 3 caractères.");
    }
  }
  
    /**
   * Insertion d'un rôle avec validation
   */
  public function insertWithValidation() 
  {
    $this->validateName();
    $this->insert();
  }

    /**
   * Sélection de tous les rôles
   */
  public static function getAllRoles() 
  {
    try {
      
      $db = self::getDBConnection();
      $requetes = $db->prepare('SELECT * FROM `role`');
      $requetes->execute();

      return $requetes->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $erreur) {

      echo "Erreur lors de la récupération des rôles : " . $erreur->getMessage();
      return array(); 
    }
  }




}
