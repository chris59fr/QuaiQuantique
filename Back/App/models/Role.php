<?php

require_once('./Back/config/Database.php');

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
  //connexion BDD
  private function getDBConnection() {
    $db = Database::getInstance();
    return $db->getConnexion();
  }

  //ajouter un role
  public function insert() {

    try {

      $requetes = $this->connexion->prepare('INSERT INTO `role`(`name_role`) VALUES (:$name_role)');
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->execute();

    } catch (PDOException $erreur) {
      
      echo "Erreur d'insertion : " . $erreur->getMessage();
    }
  }
  //lecture des role en fonction des user
  public function select() {

    try {

      $requetes = $this->connexion->prepare('SELECT `name_role` FROM `role`');
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur de selection : " . $erreur->getMessage();
    }
  }
  //changer les role 
  public function update() {

    try {
      
      $requetes = $this->connexion->prepare('UPDATE `role` SET `name_role` = :name_role WHERE `id_role` = :id_role');
      $requetes->bindParam(':name_role', $this->name_role);
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();

    } catch (PDOException $erreur) {

      echo "Erreur d'update : " . $erreur->getMessage();
    }
  }
  //supp un role
  public function delete() {

    try {

      $requetes = $this->connexion->prepare('DELETE FROM `role` WHERE `id_role` = :id_role');
      $requetes->bindParam(':id_role', $this->id_role);
      $requetes->execute();    

    } catch (PDOException $erreur){

      echo "Erreur de supression : " . $erreur->getMessage();
    }

  }

  //verification nbr caractères
  public function validateName() {
    
    if (strlen($this->name_role) < 3) {
      throw new Exception("Le nom du role doit cmporter au moins 3 caractères.");
    }
  }
  public function insertWithValidation() {
    $this->validateName();
    $this->insert();
  }

}