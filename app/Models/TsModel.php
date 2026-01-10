<?php
namespace App\Models;
use PDO;
use Throwable;
use Exception;
use App\Models\BusinessModel;

class TsModel extends BusinessModel{
    private $atributos = [];

    public function __set($name, $value){
        throw new Exception('Not implemented');
    }

    public function __get($name){
        throw new Exception('Not implemented');
    }

    public function manejarAccion($action){
        switch($action){
            default:
                throw new Exception('Acción no disponible');
        }
    }
}