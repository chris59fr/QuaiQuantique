<?php

namespace App\Repository;

use App\models\User;
use PDO;
use PDOException;

/**
 * Connection avec le methode insert etc 
 * liaison entre le model et comment il se stock
 * ici les user sont save et les vérifies leur données
 */

class UserRepository extends AbstractRepository 
{
  public function createUser(User $user) {
    
    try {

      $requetes = $this->getDBConnection()->prepare('INSERT INTO `user`(`name_user`, `firstname_user`, `dob_user`, `email_user`, `password_user`) VALUES (:name_user, :firstname_user, :dob_user, :email_user, :password_user)'); 
      $requetes->bindValue(':name_user', $user->getNameUser());
      $requetes->bindValue(':firstname_user', $user->getFristnameUser());
      $requetes->bindValue(':dob_user', $user->getDateUser());
      $requetes->bindValue(':email_user', $user->getEmailUser());
      $requetes->bindValue(':password_user', $user->getPasswordUser());

      $requetes->execute();
      echo "l'utilisateur a bien été créé";

    } catch (PDOException $error){

      echo "Erreur lors de la création de l'utilisateur" . $error->getMessage();
    }
    
  }

  public function readUser(){

    try {


    } catch (PDOException $error){

    }
  }

}