<?php
use App\Core\Router;

//================ (Rutas de Trabajo Social) ==============

Router::get('diagnostico_trabajo_social', function() {
    load_controller('tsController.php');
    diagnostico_trabajo_social();
});

Router::post('becas_registrar', function() {
    load_controller('tsController.php');
    registrar_beca();
});

Router::post('exoneracion_registrar', function() {
   load_controller('tsController.php');
   registrar_exoneracion(); 
});

Router::post('fames_registrar', function() {
    load_controller('tsController.php');
    registrar_fames();
});

Router::post('emb_registrar', function() {
    load_controller('tsController.php');
    registrar_emb();
});

Router::post('generar_pdf_socioeconomico', function() {
    load_controller('tsController.php');
    generar_pdf_socioeconomico();
});

Router::get('exoneracion_pendientes_json', function() {
    load_controller('tsController.php');
    exoneracion_pendientes_json();
});

Router::get('trabajo_social_consultar', function() {
    load_controller('tsController.php');
    consultar_diagnosticos_ts();
});

Router::get('consultar_diagnosticos_json', function() {
    load_controller('tsController.php');
    consultar_diagnosticos_json();
});