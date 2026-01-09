<?php
namespace App\Models;
use App\Models\BusinessModel;
use Error;
use PDO;
use Exception;
use Throwable;

class OrientacionModel extends BusinessModel{
    private $atributos = [];

    public function __set($name, $value){
        $this->atributos[$name] = $value;
    }

    public function __get($name){
        return $this->atributos[$name];
    }

    public function manejarAccion($action){
        switch($action){
            case 'registrar_diagnostico':
                return $this->registrar_diagnostico();

            case 'obtener_beneficiario':
                return $this->obtenerBeneficiario();

            case 'obtener_diagnostico':
                return $this->obtener_diagnostico_orientacion();

            case 'orientacion_detalle':
                return $this->orientacion_detalle();

            case 'actualizar_orientacion':
                return $this->actualizar_orientacion();

            case 'eliminar_orientacion':
                return $this->eliminar_orientacion();

            default:
                throw new Exception('Acción no permitida');
        }
    }

    private function registrar_diagnostico(){
        try{
            $this->conn->beginTransaction();
            
            $query1 = "INSERT INTO solicitud_de_servicio (id_beneficiario, id_servicios, id_empleado) VALUES (:id_beneficiario, :id_servicios, :id_empleado)";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_beneficiario', $this->__get('id_beneficiario'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_servicios', $this->__get('id_servicios'), PDO::PARAM_INT);
            $stmt1->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            $stmt1->execute();
            $id_solicitud_generado = $this->conn->lastInsertId();
            
            $query2 = "INSERT INTO orientacion (id_solicitud_serv, motivo_orientacion, indicaciones_orientacion, descripcion_orientacion, obs_adic_orientacion, fecha_creacion) 
            VALUES (:id_solicitud_serv, :motivo_orientacion, :indicaciones_orientacion, :descripcion_orientacion, :obs_adic_orientacion, CURDATE())";
            $stmt2 = $this->conn->prepare($query2);
            $stmt2->bindParam(':id_solicitud_serv', $id_solicitud_generado, PDO::PARAM_INT);
            $stmt2->bindValue(':motivo_orientacion', $this->__get('motivo_orientacion'), PDO::PARAM_STR);
            $stmt2->bindValue(':indicaciones_orientacion', $this->__get('indicaciones_orientacion'), PDO::PARAM_STR);
            $stmt2->bindValue(':descripcion_orientacion', $this->__get('descripcion_orientacion'), PDO::PARAM_STR);
            $stmt2->bindValue(':obs_adic_orientacion', $this->__get('obs_adic_orientacion'), PDO::PARAM_STR);
            $stmt2->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => "Diagnóstico registrado exitosamente"
            ];

        } catch(Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function obtenerBeneficiario(){
        try{
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

    private function obtener_diagnostico_orientacion(){
        $es_admin = $this->__get('es_admin') ?? false;
        try{
            $query = "SELECT 
                o.id_orientacion,
                o.id_solicitud_serv,
                o.motivo_orientacion,
                o.descripcion_orientacion,
                o.obs_adic_orientacion as observaciones,
                o.indicaciones_orientacion,
                o.fecha_creacion,
                ss.id_beneficiario,
                CONCAT(b.nombres, ' ', b.apellidos, ' (', b.tipo_cedula, '-', b.cedula, ')') AS beneficiario,
                CONCAT(e.nombre, ' ', e.apellido, ' (', e.tipo_cedula, '-', e.cedula, ')') AS empleado
            FROM orientacion o
            INNER JOIN solicitud_de_servicio ss ON o.id_solicitud_serv = ss.id_solicitud_serv
            INNER JOIN beneficiario b ON ss.id_beneficiario = b.id_beneficiario
            INNER JOIN dirpoles_security.empleado e ON ss.id_empleado = e.id_empleado";
            
            // Si no es administrador, filtrar por id_empleado
            if (!$es_admin) {
                $query .= " WHERE ss.id_empleado = :id_empleado";
            }
            
            $query .= " ORDER BY o.fecha_creacion DESC";
            
            $stmt = $this->conn->prepare($query);
            
            // Solo vincular el parámetro si no es administrador
            if (!$es_admin) {
                $stmt->bindValue(':id_empleado', $this->__get('id_empleado'), PDO::PARAM_INT);
            }
            
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);

        } catch(Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function orientacion_detalle(){
        try{
            $query = "SELECT 
                cm.id_orientacion,
                cm.motivo_orientacion,
                cm.descripcion_orientacion,
                cm.obs_adic_orientacion AS observaciones,
                cm.indicaciones_orientacion,
                cm.fecha_creacion,
                cm.id_solicitud_serv,
                ss.id_beneficiario,
                CONCAT(b.nombres, ' ', b.apellidos, ' (', b.tipo_cedula, '-', b.cedula, ')') AS beneficiario,
                CONCAT(e.nombre, ' ', e.apellido, ' (', e.tipo_cedula, '-', e.cedula, ')') AS empleado
            FROM orientacion cm
            INNER JOIN solicitud_de_servicio ss ON cm.id_solicitud_serv = ss.id_solicitud_serv
            INNER JOIN beneficiario b ON ss.id_beneficiario = b.id_beneficiario
            INNER JOIN dirpoles_security.empleado e ON ss.id_empleado = e.id_empleado
            WHERE cm.id_orientacion = :id_orientacion";

            $stmt = $this->conn->prepare($query);
            $stmt->bindValue(':id_orientacion', $this->__get('id_orientacion'), PDO::PARAM_INT);
            $stmt->execute();

            return $stmt->fetch(PDO::FETCH_ASSOC);

        } catch (Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function actualizar_orientacion(){
        try{
            $query = "UPDATE orientacion SET 
                        motivo_orientacion = :motivo_orientacion, 
                        indicaciones_orientacion = :indicaciones_orientacion, 
                        descripcion_orientacion = :descripcion_orientacion, 
                        obs_adic_orientacion = :obs_adic_orientacion 
                        WHERE id_orientacion = :id_orientacion";

            $stmt = $this->conn->prepare($query);
            $stmt->bindValue(':id_orientacion', $this->__get('id_orientacion'), PDO::PARAM_INT);
            $stmt->bindValue(':motivo_orientacion', $this->__get('motivo_orientacion'), PDO::PARAM_STR);
            $stmt->bindValue(':indicaciones_orientacion', $this->__get('indicaciones_orientacion'), PDO::PARAM_STR);
            $stmt->bindValue(':descripcion_orientacion', $this->__get('descripcion_orientacion'), PDO::PARAM_STR);
            $stmt->bindValue(':obs_adic_orientacion', $this->__get('obs_adic_orientacion'), PDO::PARAM_STR);
            $stmt->execute();

            return [
                'exito' => true,
                'mensaje' => 'Diagnóstico actualizado exitosamente'
            ];

        } catch(Throwable $e){
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }

    private function eliminar_orientacion(){
        try{
            $this->conn->beginTransaction();

            $query1 = "DELETE FROM orientacion WHERE id_orientacion = :id_orientacion";
            $stmt1 = $this->conn->prepare($query1);
            $stmt1->bindValue(':id_orientacion', $this->__get('id_orientacion'), PDO::PARAM_INT);
            $stmt1->execute();

            $query2 = "DELETE FROM solicitud_de_servicio WHERE id_solicitud_serv = :id_solicitud_serv"; 
            $stmt2 = $this->conn->prepare($query2);
            $stmt2->bindValue(':id_solicitud_serv', $this->__get('id_solicitud_serv'), PDO::PARAM_INT);
            $stmt2->execute();

            $this->conn->commit();
            return [
                'exito' => true,
                'mensaje' => 'Diagnóstico eliminado exitosamente'
            ];

        } catch(Throwable $e){
            $this->conn->rollBack();
            return [
                'exito' => false,
                'mensaje' => $e->getMessage()
            ];
        }
    }
}