<?php

namespace App\Repository;


/**
 * Parents des Repos
 */

abstract class AbstractRepository 
{
    /**
   * Connexion BDD
   */
  protected function getDBConnection() 
  {
    $db = Database::getInstance();
    return $db->getConnexion();
  }

}