<?php
use App\Core\Router;

//======================= (Inventario medico) =================
Router::get('crear_insumos', function() {
    load_controller('invMedicinaController.php');
    crear_insumos();
});

Router::post('registrar_insumo', function() {
    load_controller('invMedicinaController.php');
    registrar_insumo();
});

Router::get('consultar_inventario', function() {
    load_controller('invMedicinaController.php');
    consultar_inventario();
});

Router::get('inventario_data_json', function() {
    load_controller('invMedicinaController.php');
    inventario_data_json();
});

Router::get('movimientos_data_json', function() {
    load_controller('invMedicinaController.php');
    movimientos_data_json();
});

Router::get('insumos_validos_json', function() {
    load_controller('invMedicinaController.php');
    insumos_validos_json();
});

Router::post('procesar_entrada_inventario', function() {
    load_controller('invMedicinaController.php');
    procesar_entrada_inventario();
});

Router::get('insumos_para_salida_json', function() {
    load_controller('invMedicinaController.php');
    insumos_para_salida_json();
});

Router::post('procesar_salida_inventario', function() {
    load_controller('invMedicinaController.php');
    procesar_salida_inventario();
});