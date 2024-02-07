<?php

namespace App\Models;

use InvalidArgumentException;

class Role 
{
  //initial directement les props dans le constucteur
  public function __construct(private ?int $id_role ,private string $name_role)
  {
    $this->validateName($name_role);
  }

    /**
   * Getter Setter pour name_role
   */
  public function getNameRole(): string
  {
    return $this->name_role;
  }

  public function setNameRole($name_role): self
  {
    $this->validateName($name_role);
    $this->name_role = $name_role;

    return $this;
  }

    /**
   * Getter Setter pour id_role
   */
  public function getIdRole() : ?int
  {
    return $this->id_role;
  }

  public function setIdRole($id_role): self
  { 

    $this->id_role = $id_role;

    return $this;
  }
  
    /**
   * Validation du nom de rôle
   */
  public function validateName(string $name_role): void
  {
    if (strlen($name_role) < 3) {
      throw new InvalidArgumentException("Le nom du rôle doit comporter au moins 3 caractères.");
    }
  }
}
