<?php
use App\Models\BitacoraModel;

function consultar_bitacora(){
    require_once BASE_PATH . '/app/Views/bitacora/consultar_bitacora.php';
}

function bitacora_data_json(){
    $modelo = new BitacoraModel();
    header('Content-Type: application/json');
    try{

        $bitacora = $modelo->manejarAccion('consultar_bitacora');
        echo json_encode(['data' => $bitacora]);
        exit();
    } catch(Throwable $e){
        echo json_encode([
            'exito' => false,
            'mensaje' => 'Error al cargar la data de la bitacora'
        ]);
    }
}