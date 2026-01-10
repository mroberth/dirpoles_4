<?php
use App\Core\Router;

//================ (Rutas de Trabajo Social) ==============

Router::get('diagnostico_trabajo_social', function() {
    load_controller('tsController.php');
    diagnostico_trabajo_social();
});