<?php

namespace App\Models;

class User 
{
  public function __construct(private ?int $id_user, protected string $name_user)
  {
    
  }
}