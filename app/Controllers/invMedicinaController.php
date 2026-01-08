<?php

use App\Models\BitacoraModel;
use App\Models\InvMedicinaModel;
use App\Models\NotificacionesModel;
use App\Models\PermisosModel;

function crear_insumos(){
    try {
        $modelo = new InvMedicinaModel();
        
        // Obtener listas y estadísticas
        $presentaciones = $modelo->manejarAccion('obtenerPresentaciones');
        $estadisticas = $modelo->manejarAccion('obtenerEstadisticas');

        // Extraer variables para la vista
        $total_insumos = $estadisticas['total_insumos'];
        $insumos_activos = $estadisticas['insumos_activos'];
        $insumos_por_vencer = $estadisticas['insumos_por_vencer'];
        $stock_critico = $estadisticas['stock_critico'];

        require_once BASE_PATH . '/app/Views/inventario_medico/registrar_insumos.php';

    } catch (\Throwable $e) {
        die("Error en el controlador: " . $e->getMessage());
    }
}

function registrar_insumo(){
    $modelo = new InvMedicinaModel();
    $bitacora = new BitacoraModel();
    $permisos = new PermisosModel();
    $notificacion = new NotificacionesModel();
    $modulo = "Inventario Medico";

    try{
        if($_SERVER['REQUEST_METHOD'] !== 'POST'){
            throw new Exception('Metodo no permitido');
        }

        $verificar = ['Modulo' => $modulo, 'Permiso' => 'Crear', 'Rol' => $_SESSION['id_tipo_empleado']];
        foreach($verificar as $atributo => $valor){
            $permisos->__set($atributo, $valor);
        }

        if(!$permisos->manejarAccion('Verificar')){
            throw new Exception('No tienes permiso para realizar esta acción');
        }

        $nombre_insumo = filter_input(INPUT_POST, 'nombre_insumo', FILTER_DEFAULT);
        $tipo_insumo = filter_input(INPUT_POST, 'tipo_insumo', FILTER_DEFAULT);
        $id_presentacion = filter_input(INPUT_POST, 'id_presentacion', FILTER_DEFAULT);
        $fecha_vencimiento = filter_input(INPUT_POST, 'fecha_vencimiento', FILTER_DEFAULT);
        $estatus = filter_input(INPUT_POST, 'estatus', FILTER_DEFAULT);
        $descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_DEFAULT);
        $cantidad = 0;
        $id_empleado = $_SESSION['id_empleado'];

        $datos = [
            'nombre_insumo' => $nombre_insumo,
            'tipo_insumo' => $tipo_insumo,
            'id_presentacion' => $id_presentacion,
            'fecha_vencimiento' => $fecha_vencimiento,
            'estatus' => $estatus,
            'descripcion' => $descripcion,
            'cantidad' => $cantidad,
            'id_empleado' => $id_empleado
        ];

        $campos_obligatorios = [
            'nombre_insumo', 'tipo_insumo', 'id_presentacion', 'fecha_vencimiento', 
            'estatus', 'descripcion'
        ];

        foreach ($campos_obligatorios as $campo) {
            if (empty($datos[$campo])) {
                throw new Exception("El campo '{$campo}' es obligatorio");
            }
        }

        foreach($datos as $atributo => $valor){
            $modelo->__set($atributo, $valor);
        }

        $resultado = $modelo->manejarAccion('registrar_insumo');
        if($resultado['exito']){
            $bitacora_data = [
                'id_empleado' => $_SESSION['id_empleado'],
                'modulo' => $modulo,
                'accion' => 'Registro',
                'descripcion' => "El Empleado {$_SESSION['nombre']} registro el insumo '{$nombre_insumo}' en el inventario médico."
            ];
            foreach($bitacora_data as $atributo => $valor){
                $bitacora->__set($atributo, $valor);
            }
            $bitacora->manejarAccion('registrar_bitacora');

            $notificacion_data = [
                'titulo' => 'Registro de insumo',
                'url' => 'consultar_inventario_medico',
                'tipo' => 'inventario',
                'id_emisor' => $_SESSION['id_empleado'],
                'id_receptor' => 1, //Administrador
                'leido' => 0
            ];
            foreach($notificacion_data as $atributo => $valor){
                $notificacion->__set($atributo, $valor);
            }
            $notificacion->manejarAccion('crear_notificacion');

            echo json_encode([
                'exito' => true,
                'mensaje' => $resultado['mensaje']
            ]);
        } else {
            throw new Exception($resultado['mensaje'] ?? 'Error al registrar el insumo');
        }

    } catch(Throwable $e){
        echo json_encode([
            'exito' => false,
            'mensaje' => $e->getMessage()
        ]);
        exit();
    }
}

function consultar_inventario(){
    require_once BASE_PATH . '/app/Views/inventario_medico/consultar_inventario.php';
}

function inventario_data_json(){
    $modelo = new InvMedicinaModel();
    header('Content-Type: application/json');
    
    try {
        $insumos = $modelo->manejarAccion('consultar_inventario');
        echo json_encode(['data' => $insumos]);
        exit();

    } catch(Throwable $e) {
        error_log("Error en inventario_data_json: " . $e->getMessage());
        echo json_encode([
            'data' => [],
            'error' => 'Error al cargar los insumos'
        ]);
        exit();
    }
}

function movimientos_data_json(){
    $modelo = new InvMedicinaModel();
    header('Content-Type: application/json');
    
    try {
        $movimientos = $modelo->manejarAccion('consultar_movimientos');
        echo json_encode(['data' => $movimientos]);
        exit();

    } catch(Throwable $e) {
        error_log("Error en movimientos_data_json: " . $e->getMessage());
        echo json_encode([
            'data' => [],
            'error' => 'Error al cargar los movimientos'
        ]);
        exit();
    }
}

function insumos_validos_json(){
    $modelo = new InvMedicinaModel();
    header('Content-Type: application/json');
    
    try {
        $insumos = $modelo->manejarAccion('obtenerInsumosValidos');
        echo json_encode($insumos);
        exit();

    } catch(Throwable $e) {
        echo json_encode(['error' => $e->getMessage()]);
        exit();
    }
}

function procesar_entrada_inventario(){
    $modelo = new InvMedicinaModel();
    $bitacora = new BitacoraModel();
    $notificacion = new NotificacionesModel();
    $modulo = "Inventario Medico";

    $modelo->__set('id_insumo', $_POST['id_insumo']);
    $modelo->__set('cantidad', $_POST['cantidad']);
    $modelo->__set('descripcion', $_POST['descripcion']);
    $modelo->__set('id_empleado', $_SESSION['id_empleado']);

    $insumo = $modelo->manejarAccion('obtener_insumo_entrada');
    header('Content-Type: application/json');
    
    try {
        $resultado = $modelo->manejarAccion('registrar_entrada');
        if($resultado['exito']){
            $bitacora_data = [
                'id_empleado' => $_SESSION['id_empleado'],
                'modulo' => $modulo,
                'accion' => 'Registro',
                'descripcion' => "El Empleado {$_SESSION['nombre']} registro la entrada del insumo $insumo en el inventario médico."
            ];
            foreach($bitacora_data as $atributo => $valor){
                $bitacora->__set($atributo, $valor);
            }
            $bitacora->manejarAccion('registrar_bitacora');

            $notificacion_data = [
                'titulo' => 'Registro de entrada',
                'url' => 'consultar_inventario_medico',
                'tipo' => 'sistema',
                'id_emisor' => $_SESSION['id_empleado'],
                'id_receptor' => 1, //Administrador
                'leido' => 0
            ];
            foreach($notificacion_data as $atributo => $valor){
                $notificacion->__set($atributo, $valor);
            }
            $notificacion->manejarAccion('crear_notificacion');
        }

        echo json_encode([
            'exito' => true,
            'mensaje' => $resultado['mensaje']
        ]);

    } catch(Throwable $e) {
        echo json_encode([
            'exito' => false,
            'mensaje' => $e->getMessage()
        ]);
    }
    exit();
}

function insumos_para_salida_json(){
    $modelo = new InvMedicinaModel();
    header('Content-Type: application/json');
    
    try {
        $insumos = $modelo->manejarAccion('obtenerInsumosParaSalida');
        echo json_encode($insumos);
        exit();

    } catch(Throwable $e) {
        echo json_encode(['error' => $e->getMessage()]);
        exit();
    }
}

function procesar_salida_inventario(){
    $modelo = new InvMedicinaModel();
    $bitacora = new BitacoraModel();
    $notificacion = new NotificacionesModel();
    $modulo = "Inventario Medico";

    $modelo->__set('id_insumo', $_POST['id_insumo']);
    $modelo->__set('cantidad', $_POST['cantidad']);
    $modelo->__set('motivo', $_POST['motivo']);
    $modelo->__set('descripcion', $_POST['descripcion']);
    $modelo->__set('id_empleado', $_SESSION['id_empleado']);

    // Obtener nombre del insumo para log
    $insumoNombre = $modelo->manejarAccion('obtener_insumo_entrada');

    header('Content-Type: application/json');
    
    try {
        $resultado = $modelo->manejarAccion('registrar_salida');

        if($resultado['exito']){
            // Bitacora
            $bitacora_data = [
                'id_empleado' => $_SESSION['id_empleado'],
                'modulo' => $modulo,
                'accion' => 'Registro',
                'descripcion' => "El Empleado {$_SESSION['nombre']} registró salida ({$_POST['motivo']}) del insumo $insumoNombre en el inventario médico."
            ];
            foreach($bitacora_data as $atributo => $valor){
                $bitacora->__set($atributo, $valor);
            }
            $bitacora->manejarAccion('registrar_bitacora');

            $notificacion_data = [
                'titulo' => 'Salida de Inventario',
                'url' => 'consultar_inventario_medico',
                'tipo' => 'sistema',
                'id_emisor' => $_SESSION['id_empleado'],
                'id_receptor' => 1, //Administrador
                'leido' => 0
            ];
            foreach($notificacion_data as $atributo => $valor){
                $notificacion->__set($atributo, $valor);
            }
            $notificacion->manejarAccion('crear_notificacion');
        }

        echo json_encode([
            'exito' => true,
            'mensaje' => $resultado['mensaje']
        ]);
    } catch(Throwable $e) {
        echo json_encode([
            'exito' => false,
            'mensaje' => $e->getMessage()
        ]);
    }
    exit();
}