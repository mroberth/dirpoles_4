<?php
use App\Core\Router;

//================= (Rutas del diagnostico de orientación) =====================

Router::get('diagnostico_orientacion', function() {
    load_controller('orientacionController.php');
    diagnostico_orientacion();
});