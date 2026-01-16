<?php
namespace App\Models;
use PDO;
use Throwable;
use Exception;
use App\Models\BusinessModel;

class TsModel extends BusinessModel{
    private $atributos = [];

    public function __set($name, $value){
        $this->atributos[$name] = $value;
    }

    public function __get($name){
        return $this->atributos[$name] ?? null;
    }

    public function manejarAccion($action){
        switch($action){
            case 'obtener_beneficiario':
                return $this->obtenerBeneficiario();

            case 'registrar_beca':
                return $this->registrarBeca();

            case 'registrar_exoneracion':
                return $this->registrarExoneracion();

            case 'registrar_fames':
                return $this->registrarFames();

            case 'registrar_emb':
                return $this->registrarEmb();

            case 'obtener_patologias':
                return $this->obtenerPatologias();

            case 'obtener_exoneraciones_pendientes':
                return $this->obtenerExoneracionesPendientes();

            case 'actualizar_exoneracion_estudio':
                return $this->actualizarExoneracionConEstudio();

            case 'listar_becas':
                return $this->listarBecas();
            case 'listar_exoneraciones':
                return $this->listarExoneraciones();
            case 'listar_fames':
                return $this->listarFames();
            case 'listar_embarazadas':
                return $this->listarEmbarazadas();

            default:
                throw new Exception('Acción no disponible');
        }
    }

    private function obtenerBeneficiario(){
        try{
            // Se usa CONCAT para formatear el nombre completo y la cédula
            $query = "SELECT CONCAT(nombres, ' ', apellidos, ' (', tipo_cedula, ' - ', cedula, ')') as nombre_completo 
                      FROM beneficiario 
                      WHERE id_beneficiario = :id_beneficiario";
            
            $stmt = $this->conn->prepare($query);
            $stmt->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt->execute();

            $resultado = $stmt->fetch(PDO::FETCH_ASSOC);
            
            // Retornamos el valor de la columna concatenada o string vacío si no hay resultado
            return $resultado ? $resultado['nombre_completo'] : '';

        } catch(Throwable $e){
            // En caso de error, retornamos un mensaje genérico o vacío para evitar romper el flujo
            return "Beneficiario desconocido"; 
        }
    }

    private function obtenerPatologias(){
        try{
            $query = "SELECT id_patologia, nombre_patologia, tipo_patologia FROM patologia WHERE id_patologia NOT IN (1, 2)";
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);

        } catch(Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function registrarBeca(){
        try {
            $this->conn->beginTransaction();

            $query1 = "INSERT INTO solicitud_de_servicio (id_beneficiario, id_servicios, id_empleado) VALUES (:id_beneficiario, :id_servicios, :id_empleado)";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            $stmt1->execute();
            $id_solicitud_generado = $this->conn->lastInsertId();

            $query2 = "INSERT INTO becas (id_solicitud_serv, cta_bcv, direccion_pdf, tipo_banco, fecha_creacion) VALUES (:id_solicitud_serv, :cta_bcv, :direccion_pdf, :tipo_banco, CURDATE())";
            $stmt2 = $this->conn->prepare($query2);
            $stmt2->bindParam(':id_solicitud_serv', $id_solicitud_generado, PDO::PARAM_INT);
            $stmt2->bindValue(':cta_bcv', $this->__get('cta_bcv'), PDO::PARAM_STR);
            $stmt2->bindValue(':direccion_pdf', $this->__get('direccion_pdf'), PDO::PARAM_STR);
            $stmt2->bindValue(':tipo_banco', $this->__get('tipo_banco'), PDO::PARAM_STR);
            $stmt2->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => 'Beca registrada exitosamente'
            ];

        } catch (Throwable $e) {
            $this->conn->rollBack();
            error_log("Error al crear la consulta trabajo social: " . $e->getMessage());
            throw new Exception('Error al crear la consulta de trabajo social: ' . $e->getMessage());
        }
    }

    private function registrarExoneracion(){
        try{
             $this->conn->beginTransaction();

            $query1 = "INSERT INTO solicitud_de_servicio (id_beneficiario, id_servicios, id_empleado) VALUES (:id_beneficiario, :id_servicios, :id_empleado)";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            $stmt1->execute();
            $id_solicitud_generado = $this->conn->lastInsertId();

            $query2 = "INSERT INTO exoneracion (id_solicitud_serv, motivo, direccion_carta, direccion_estudiose, otro_motivo, carnet_discapacidad, fecha_creacion) VALUES (:id_solicitud_serv, :motivo, :direccion_carta, NULL, :otro_motivo, :carnet_discapacidad, curdate())";

            $stmt2 = $this->conn->prepare($query2);
            $stmt2->bindParam(':id_solicitud_serv', $id_solicitud_generado, PDO::PARAM_INT);
            $stmt2->bindValue(':direccion_carta', $this->__get('direccion_carta'), PDO::PARAM_STR);
            $stmt2->bindValue(':motivo', $this->__get('motivo'), PDO::PARAM_STR);  
            $stmt2->bindValue(':otro_motivo', $this->__get('otro_motivo'), PDO::PARAM_STR); 
            $stmt2->bindValue(':carnet_discapacidad', $this->__get('carnet_discapacidad'), PDO::PARAM_STR); 
            $stmt2->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => "Exoneracion registrada exitosamente"
            ];

        }catch(Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function registrarFames(){
        try{
            $this->conn->beginTransaction();

            $query1 = "INSERT INTO solicitud_de_servicio (id_beneficiario, id_servicios, id_empleado) VALUES (:id_beneficiario, :id_servicios, :id_empleado)";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            $stmt1->execute();
            $id_solicitud_generado = $this->conn->lastInsertId();

            $query3 = "INSERT INTO detalle_patologia (id_patologia) VALUES (:id_patologia)";
            $stmt3 = $this->conn->prepare($query3);
            $stmt3->bindValue(':id_patologia', $this->__get('id_patologia'), PDO::PARAM_INT);
            $stmt3->execute();
            $id_patologia_generado = $this->conn->lastInsertId();

            $query2 = "INSERT INTO fames (id_solicitud_serv, id_detalle_patologia, tipo_ayuda, otro_tipo, fecha_creacion) VALUES (:id_solicitud_serv, :patologia, :tipo_ayuda, :otro_tipo, curdate())";
            $stmt2 = $this->conn->prepare($query2);
            $stmt2->bindParam(':id_solicitud_serv', $id_solicitud_generado, PDO::PARAM_INT);
            $stmt2->bindParam(':patologia', $id_patologia_generado, PDO::PARAM_INT);
            $stmt2->bindValue(':tipo_ayuda', $this->__get('tipo_ayuda'), PDO::PARAM_STR);
            $stmt2->bindValue(':otro_tipo', $this->__get('otro_tipo'), PDO::PARAM_STR);
            $stmt2->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => "Fames registrado exitosamente"
            ];

        } catch(Throwable $e){
            $this->conn->rollBack();
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function registrarEmb(){
        try {
            $this->conn->beginTransaction();
            // Validar duplicados antes de comenzar la transacción
            if ($this->validar_embarazadas_registradas()) {
                throw new Exception('El beneficiario ya tiene un registro de embarazo activo');
            }

            $query1 = "INSERT INTO solicitud_de_servicio (id_beneficiario, id_servicios, id_empleado) VALUES (:id_beneficiario, :id_servicios, :id_empleado)";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            $stmt1->execute();
            $id_solicitud_generado = $this->conn->lastInsertId();

            $query3 = "INSERT INTO detalle_patologia (id_patologia) VALUES (:id_patologia)";
            $stmt3 = $this->conn->prepare($query3);
            $stmt3->bindValue(':id_patologia', $this->__get('id_patologia'), PDO::PARAM_INT);
            $stmt3->execute();
            $id_patologia_generado = $this->conn->lastInsertId();

            $query5 = "INSERT INTO gestion_emb (id_solicitud_serv, id_detalle_patologia, semanas_gest, codigo_patria, serial_patria, estado, fecha_creacion) VALUES (:id_solicitud_serv, :id_detalle_patologia, :semanas_gest, :codigo_patria, :serial_patria, :estado, curdate())";
            $stmt5 = $this->conn->prepare($query5);
            $stmt5->bindParam(':id_solicitud_serv', $id_solicitud_generado, PDO::PARAM_INT);
            $stmt5->bindParam(':id_detalle_patologia', $id_patologia_generado, PDO::PARAM_INT);
            $stmt5->bindValue(':semanas_gest', $this->__get('semanas_gest'), PDO::PARAM_INT);
            $stmt5->bindValue(':codigo_patria', $this->__get('codigo_patria'), PDO::PARAM_STR);
            $stmt5->bindValue(':serial_patria', $this->__get('serial_patria'), PDO::PARAM_STR);
            $stmt5->bindValue(':estado', $this->__get('estado'), PDO::PARAM_STR);
            $stmt5->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => 'Diagnóstico de Embarazada registrado exitosamente'
            ];

        } catch (Throwable $e) {
            $this->conn->rollBack();
            error_log('Error al crear el diagnostico de embarazada: ' . $e->getMessage());
            throw new Exception($e->getMessage());
        }
    }

    private function validar_embarazadas_registradas(){
        try{
            // Validar si ya existe una solicitud de servicio para este beneficiario con el mismo servicio
            $query = "SELECT COUNT(*) AS total 
                    FROM solicitud_de_servicio s
                    INNER JOIN gestion_emb g ON s.id_solicitud_serv = g.id_solicitud_serv
                    WHERE s.id_beneficiario = :id_beneficiario 
                    AND s.id_servicios = :id_servicios
                    AND g.estado = 'En proceso'";
            
            $stmt = $this->conn->prepare($query);
            $stmt->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt->execute();
            
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result['total'] > 0;

        } catch (Throwable $e) {
            error_log('Error al validar embarazadas registradas: ' . $e->getMessage());
            throw new Exception('Error al validar registro duplicado: ' . $e->getMessage());
        }
    }

    private function obtenerExoneracionesPendientes(){
        try{
            // Buscamos exoneraciones donde direccion_estudiose es NULL
            // Join con solicitud y beneficiario para obtener datos para el modal
            $query = "SELECT 
                        e.id_exoneracion, 
                        e.motivo, 
                        e.fecha_creacion,
                        b.id_beneficiario,
                        b.nombres,
                        b.apellidos,
                        b.cedula,
                        b.tipo_cedula,
                        b.fecha_nac AS fecha_nacimiento,
                        b.seccion,
                        b.correo,
                        b.telefono,
                        -- Obtenemos el título del PNF si es estudiante (puede ser NULL)
                        (SELECT nombre_pnf FROM pnf WHERE id_pnf = b.id_pnf) as pnf_nombre
                      FROM exoneracion e
                      INNER JOIN solicitud_de_servicio s ON e.id_solicitud_serv = s.id_solicitud_serv
                      INNER JOIN beneficiario b ON s.id_beneficiario = b.id_beneficiario
                      WHERE e.direccion_estudiose IS NULL
                      ORDER BY e.fecha_creacion DESC";
            
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);

        } catch(Throwable $e){
            error_log("Error obteniendo exoneraciones pendientes: " . $e->getMessage());
            return []; 
        }
    }

    private function actualizarExoneracionConEstudio(){
        try {
            $id_exoneracion = $this->__get('id_exoneracion');
            $ruta_pdf = $this->__get('direccion_estudiose');

            if(!$id_exoneracion || !$ruta_pdf){
                // Si no hay ID de exoneración validamos si se permite (caso borde) pero por regla de negocio requerimos ID
                // Pero si el usuario borró la exoneración manualmente mientras se hacía el estudio... 
                // En este flujo estricto, lanzamos error si falta ID.
                throw new Exception("Datos incompletos para actualizar la exoneración");
            }

            $query = "UPDATE exoneracion SET direccion_estudiose = :ruta WHERE id_exoneracion = :id";
            $stmt = $this->conn->prepare($query);
            $stmt->bindValue(':ruta', $ruta_pdf, PDO::PARAM_STR);
            $stmt->bindValue(':id', $id_exoneracion, PDO::PARAM_INT);
            $stmt->execute();

            return [
                'exito' => true, 
                'mensaje' => 'Exoneración actualizada correctamente'
            ];

        } catch (Throwable $e) {
            error_log("Error actualizando exoneracion con estudio: " . $e->getMessage());
             return [
                'exito' => false, 
                'mensaje' => 'Error al vincular el estudio con la exoneración'
            ];
        }
    }

    private function listarBecas(){
        try {
            $query = "SELECT 
                        b.id_becas, 
                        b.fecha_creacion, 
                        b.tipo_banco, 
                        b.cta_bcv,
                        b.direccion_pdf,
                        ben.nombres, 
                        ben.apellidos, 
                        ben.cedula,
                        ben.tipo_cedula,
                        e.nombre as empleado_nombre,
                        e.apellido as empleado_apellido
                      FROM becas b
                      INNER JOIN solicitud_de_servicio s ON b.id_solicitud_serv = s.id_solicitud_serv
                      INNER JOIN beneficiario ben ON s.id_beneficiario = ben.id_beneficiario
                      INNER JOIN dirpoles_security.empleado e ON s.id_empleado = e.id_empleado
                      ORDER BY b.fecha_creacion DESC";
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }
    }

    private function listarExoneraciones(){
        try {
            $query = "SELECT 
                        ex.id_exoneracion, 
                        ex.fecha_creacion, 
                        ex.motivo, 
                        ex.otro_motivo,
                        ex.direccion_carta,
                        ex.direccion_estudiose,
                        ben.nombres, 
                        ben.apellidos, 
                        ben.cedula,
                        ben.tipo_cedula,
                        e.nombre as empleado_nombre,
                        e.apellido as empleado_apellido
                      FROM exoneracion ex
                      INNER JOIN solicitud_de_servicio s ON ex.id_solicitud_serv = s.id_solicitud_serv
                      INNER JOIN beneficiario ben ON s.id_beneficiario = ben.id_beneficiario
                      INNER JOIN dirpoles_security.empleado e ON s.id_empleado = e.id_empleado
                      ORDER BY ex.fecha_creacion DESC";
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }
    }

    private function listarFames(){
        try {
            $query = "SELECT 
                        f.id_fames, 
                        f.fecha_creacion, 
                        f.tipo_ayuda,
                        f.otro_tipo,
                        p.nombre_patologia,
                        ben.nombres, 
                        ben.apellidos, 
                        ben.cedula,
                        ben.tipo_cedula,
                        e.nombre as empleado_nombre,
                        e.apellido as empleado_apellido
                      FROM fames f
                      INNER JOIN solicitud_de_servicio s ON f.id_solicitud_serv = s.id_solicitud_serv
                      INNER JOIN detalle_patologia dp ON f.id_detalle_patologia = dp.id_detalle_patologia
                      INNER JOIN patologia p ON dp.id_patologia = p.id_patologia
                      INNER JOIN beneficiario ben ON s.id_beneficiario = ben.id_beneficiario
                      INNER JOIN dirpoles_security.empleado e ON s.id_empleado = e.id_empleado
                      ORDER BY f.fecha_creacion DESC";
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }
    }

    private function listarEmbarazadas(){
        try {
            $query = "SELECT 
                        g.id_gestion, 
                        g.fecha_creacion, 
                        g.semanas_gest, 
                        g.estado,
                        g.codigo_patria,
                        ben.nombres, 
                        ben.apellidos, 
                        ben.cedula,
                        ben.tipo_cedula,
                        e.nombre as empleado_nombre,
                        e.apellido as empleado_apellido
                      FROM gestion_emb g
                      INNER JOIN solicitud_de_servicio s ON g.id_solicitud_serv = s.id_solicitud_serv
                      INNER JOIN beneficiario ben ON s.id_beneficiario = ben.id_beneficiario
                      INNER JOIN dirpoles_security.empleado e ON s.id_empleado = e.id_empleado
                      ORDER BY g.fecha_creacion DESC";
            $stmt = $this->conn->query($query);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }
    }
}