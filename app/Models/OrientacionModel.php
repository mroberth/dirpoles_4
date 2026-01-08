<?php
namespace App\Models;
use App\Models\BusinessModel;
use PDO;
use Exception;
use Throwable;

class OrientacionModel extends BusinessModel{
    private $atributos = [];

    public function __set($nombre, $valor){
        
    }

    public function __get($name){
        
    }

    public function manejarAccion($action){
        switch($action){
            default:
                throw new Exception('Acción no permitida');
        }
    }
}