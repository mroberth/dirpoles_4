<?php 
$titulo = "Trabajo Social";
include BASE_PATH . '/app/Views/template/head.php';
?>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <?php include BASE_PATH . '/app/Views/template/sidebar.php'; ?>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <?php include BASE_PATH . '/app/Views/template/header.php'; ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h2 mb-0 text-gray-800">Gestión de Beneficios Sociales</h1>
                        <a href="<?= BASE_URL ?>beneficios_sociales_consultar" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                            <i class="fas fa-clipboard-list fa-sm text-white-50 me-1"></i> Consultar Beneficios
                        </a>
                    </div>

                    <!-- Sección de Selección de Beneficiario (Global) -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                        <i class="fas fa-user-injured me-2"></i>Datos del Beneficiario
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="input-group">
                                                <span class="input-group-text bg-light text-primary fw-bold">
                                                    <i class="fas fa-user me-2"></i>Beneficiario
                                                </span>
                                                <input type="text" class="form-control bg-white" id="beneficiario_nombre" 
                                                    placeholder="Seleccione un beneficiario desde la lupa..." readonly 
                                                    style="color: #4e73df;">
                                                <input type="hidden" id="id_beneficiario">
                                                
                                                <button class="btn btn-outline-danger" type="button" id="btnEliminarBeneficiario" title="Limpiar selección" style="display: none;">
                                                    <i class="fa-solid fa-times"></i>
                                                </button>
                                                <button class="btn btn-primary" type="button" id="btnSeleccionarBeneficiario" 
                                                        data-bs-toggle="modal" data-bs-target="#modalSeleccionarBeneficiario">
                                                    <i class="fas fa-search me-1"></i> Buscar
                                                </button>
                                            </div>
                                            <div class="invalid-feedback" id="beneficiario_nombreError"></div>
                                            <small class="text-muted mt-2 d-block ms-1">
                                                <i class="fas fa-info-circle me-1"></i>
                                                El beneficiario seleccionado se aplicará automáticamente a todos los formularios de esta página.
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Fila 1: Becas y Exoneración -->
                    <div class="row">
                        <!-- Columna 1: Becas -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow h-100 border-left-success">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-success">
                                        <i class="fas fa-graduation-cap me-2"></i>Registro de Becas
                                    </h6>
                                    <span class="badge bg-success">Ayuda Económica</span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <form action="<?= BASE_URL ?>becas_registrar" method="POST" id="form-becas" class="needs-validation d-flex flex-column h-100" novalidate>
                                        <input type="hidden" name="id_beneficiario" class="id_beneficiario_hidden">
                                        <input type="hidden" name="id_empleado" value="<?= $_SESSION['id_empleado'] ?>">
                                        
                                        <div class="row">
                                            <!-- Cuenta BCV -->
                                            <div class="col-md-6 mb-3">
                                                <label for="cta_bcv" class="form-label">
                                                    Cuenta BCV <span class="text-danger">*</span>
                                                </label>
                                                <input type="text" class="form-control" id="cta_bcv" name="cta_bcv" 
                                                    placeholder="Ej: 12345678901234567890" maxlength="100">
                                                <div class="invalid-feedback" id="cta_bcvError"></div>
                                                <small class="form-text text-muted">
                                                    Número de cuenta bancaria BCV (20 dígitos)
                                                </small>
                                            </div>

                                            <!-- Tipo de Banco -->
                                            <div class="col-md-6 mb-3">
                                                <label for="tipo_banco" class="form-label">
                                                    Tipo de Banco <span class="text-danger">*</span>
                                                </label>
                                                <select name="tipo_banco" id="tipo_banco" class="form-select" required>
                                                    <option value="" selected disabled>Seleccione tipo de banco</option>
                                                    <option value="BCV">BCV</option>
                                                    <option value="BDV">BDV</option>
                                                    <option value="BNC">BNC</option>
                                                    <option value="BAN">Banesco</option>
                                                    <option value="MER">Mercantil</option>
                                                    <option value="PRO">Provincial</option>
                                                    <option value="VEN">Venezuela</option>
                                                </select>
                                                <div class="invalid-feedback" id="tipo_bancoError"></div>
                                            </div>
                                            
                                            <!-- Dirección PDF -->
                                            <div class="col-12 mb-3">
                                                <label for="direccion_pdf" class="form-label">
                                                    Archivo PDF (Opcional)
                                                </label>
                                                <input type="text" class="form-control" id="direccion_pdf" name="direccion_pdf" 
                                                    placeholder="Ruta del archivo PDF subido..." maxlength="100">
                                                <div class="invalid-feedback" id="direccion_pdfError"></div>
                                                <small class="form-text text-muted">
                                                    Nombre del archivo PDF subido al sistema (se cargará por separado)
                                                </small>
                                            </div>
                                        </div>
                                        
                                        <!-- Botones -->
                                        <div class="text-end mt-auto pt-3">
                                            <button type="button" class="btn btn-outline-secondary" id="btnLimpiarFormularioBecas">
                                                <i class="fas fa-times me-1"></i> Limpiar
                                            </button>
                                            <button type="submit" class="btn btn-success">
                                                <i class="fas fa-graduation-cap me-1"></i> Registrar Beca
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Columna 2: Exoneración -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow h-100 border-left-warning">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-warning">
                                        <i class="fas fa-file-contract me-2"></i>Registro de Exoneración
                                    </h6>
                                    <span class="badge bg-warning">Beneficio Estatal</span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <form action="<?= BASE_URL ?>exoneracion_registrar" method="POST" id="form-exoneracion" class="needs-validation d-flex flex-column h-100" novalidate>
                                        <input type="hidden" name="id_beneficiario" class="id_beneficiario_hidden">
                                        <input type="hidden" name="id_empleado" value="<?= $_SESSION['id_empleado'] ?>">
                                        
                                        <div class="row">
                                            <!-- Motivo -->
                                            <div class="col-md-6 mb-3">
                                                <label for="motivo" class="form-label">
                                                    Motivo <span class="text-danger">*</span>
                                                </label>
                                                <select name="motivo" id="motivo" class="form-select" required>
                                                    <option value="" selected disabled>Seleccione motivo</option>
                                                    <option value="Discapacidad">Discapacidad</option>
                                                    <option value="Estudio Socio-Económico">Estudio Socio-Económico</option>
                                                    <option value="Otro">Otro</option>
                                                </select>
                                                <div class="invalid-feedback" id="motivoError"></div>
                                            </div>

                                            <!-- Carnet de Discapacidad -->
                                            <div class="col-md-6 mb-3">
                                                <label for="carnet_discapacidad" class="form-label">
                                                    Carnet Discapacidad <span class="text-danger">*</span>
                                                </label>
                                                <input type="text" class="form-control" id="carnet_discapacidad" name="carnet_discapacidad" 
                                                    placeholder="Número de carnet" maxlength="100">
                                                <div class="invalid-feedback" id="carnet_discapacidadError"></div>
                                            </div>
                                            
                                            <!-- Otro motivo (condicional) -->
                                            <div class="col-12 mb-3" id="otro_motivo_container" style="display: none;">
                                                <label for="otro_motivo" class="form-label">
                                                    Especifique otro motivo
                                                </label>
                                                <input type="text" class="form-control" id="otro_motivo" name="otro_motivo" 
                                                    placeholder="Describa el motivo..." maxlength="100">
                                                <div class="invalid-feedback" id="otro_motivoError"></div>
                                            </div>
                                            
                                            <!-- Dirección Carta -->
                                            <div class="col-md-6 mb-3">
                                                <label for="direccion_carta" class="form-label">
                                                    Carta (Opcional)
                                                </label>
                                                <input type="text" class="form-control" id="direccion_carta" name="direccion_carta" 
                                                    placeholder="Ruta de carta..." maxlength="100">
                                                <div class="invalid-feedback" id="direccion_cartaError"></div>
                                            </div>
                                            
                                            <!-- Dirección Estudio Socio-Económico -->
                                            <div class="col-md-6 mb-3">
                                                <label for="direccion_estudiose" class="form-label">
                                                    Estudio Socio-Económico (Opcional)
                                                </label>
                                                <input type="text" class="form-control" id="direccion_estudiose" name="direccion_estudiose" 
                                                    placeholder="Ruta del estudio..." maxlength="100">
                                                <div class="invalid-feedback" id="direccion_estudioseError"></div>
                                            </div>
                                        </div>
                                        
                                        <!-- Botones -->
                                        <div class="text-end mt-auto pt-3">
                                            <button type="button" class="btn btn-outline-secondary" id="btnLimpiarFormularioExoneracion">
                                                <i class="fas fa-times me-1"></i> Limpiar
                                            </button>
                                            <button type="submit" class="btn btn-warning">
                                                <i class="fas fa-file-contract me-1"></i> Registrar Exoneración
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Fila 2: FAMES y Gestión de Embarazadas -->
                    <div class="row">
                        <!-- Columna 1: FAMES -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow h-100 border-left-info">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-info">
                                        <i class="fas fa-hand-holding-heart me-2"></i>Registro FAMES
                                    </h6>
                                    <span class="badge bg-info">Ayuda Alimentaria</span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <form action="<?= BASE_URL ?>fames_registrar" method="POST" id="form-fames" class="needs-validation d-flex flex-column h-100" novalidate>
                                        <input type="hidden" name="id_beneficiario" class="id_beneficiario_hidden">
                                        <input type="hidden" name="id_empleado" value="<?= $_SESSION['id_empleado'] ?>">
                                        
                                        <div class="row">
                                            <!-- Patología -->
                                            <div class="col-md-6 mb-3">
                                                <label for="id_detalle_patologia" class="form-label">
                                                    Patología <span class="text-danger">*</span>
                                                </label>
                                                <select name="id_detalle_patologia" id="id_detalle_patologia" class="form-select select2" required>
                                                    <option value="" selected disabled>Seleccione una patología</option>
                                                    <?php foreach ($patologias as $patologia): ?>
                                                        <option value="<?= $patologia['id_detalle_patologia'] ?>">
                                                            <?= htmlspecialchars($patologia['nombre_patologia']) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="id_detalle_patologiaError"></div>
                                            </div>

                                            <!-- Tipo de Ayuda -->
                                            <div class="col-md-6 mb-3">
                                                <label for="tipo_ayuda" class="form-label">
                                                    Tipo de Ayuda <span class="text-danger">*</span>
                                                </label>
                                                <select name="tipo_ayuda" id="tipo_ayuda" class="form-select" required>
                                                    <option value="" selected disabled>Seleccione tipo</option>
                                                    <option value="Alimenticia">Alimenticia</option>
                                                    <option value="Económica">Económica</option>
                                                    <option value="Medicamentos">Medicamentos</option>
                                                    <option value="Otro">Otro</option>
                                                </select>
                                                <div class="invalid-feedback" id="tipo_ayudaError"></div>
                                            </div>
                                            
                                            <!-- Otro tipo (condicional) -->
                                            <div class="col-12 mb-3" id="otro_tipo_container" style="display: none;">
                                                <label for="otro_tipo" class="form-label">
                                                    Especifique otro tipo
                                                </label>
                                                <input type="text" class="form-control" id="otro_tipo" name="otro_tipo" 
                                                    placeholder="Describa el tipo de ayuda..." maxlength="100">
                                                <div class="invalid-feedback" id="otro_tipoError"></div>
                                            </div>
                                        </div>
                                        
                                        <!-- Botones -->
                                        <div class="text-end mt-auto pt-3">
                                            <button type="button" class="btn btn-outline-secondary" id="btnLimpiarFormularioFames">
                                                <i class="fas fa-times me-1"></i> Limpiar
                                            </button>
                                            <button type="submit" class="btn btn-info">
                                                <i class="fas fa-hand-holding-heart me-1"></i> Registrar FAMES
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Columna 2: Gestión de Embarazadas -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow h-100 border-left-primary">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <h6 class="m-0 font-weight-bold text-primary">
                                        <i class="fas fa-baby me-2"></i>Gestión de Embarazadas
                                    </h6>
                                    <span class="badge bg-primary">Control Prenatal</span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <form action="<?= BASE_URL ?>gestion_emb_registrar" method="POST" id="form-gestion-emb" class="needs-validation d-flex flex-column h-100" novalidate>
                                        <input type="hidden" name="id_beneficiario" class="id_beneficiario_hidden">
                                        <input type="hidden" name="id_empleado" value="<?= $_SESSION['id_empleado'] ?>">
                                        
                                        <div class="row">
                                            <!-- Patología (embarazo) -->
                                            <div class="col-md-6 mb-3">
                                                <label for="id_detalle_patologia_emb" class="form-label">
                                                    Patología (Embarazo) <span class="text-danger">*</span>
                                                </label>
                                                <select name="id_detalle_patologia" id="id_detalle_patologia_emb" class="form-select select2" required>
                                                    <option value="" selected disabled>Seleccione patología de embarazo</option>
                                                    <?php foreach ($patologias_embarazo as $patologia): ?>
                                                        <option value="<?= $patologia['id_detalle_patologia'] ?>">
                                                            <?= htmlspecialchars($patologia['nombre_patologia']) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                                <div class="invalid-feedback" id="id_detalle_patologiaError"></div>
                                            </div>

                                            <!-- Semanas de Gestación -->
                                            <div class="col-md-6 mb-3">
                                                <label for="semanas_gest" class="form-label">
                                                    Semanas de Gestación <span class="text-danger">*</span>
                                                </label>
                                                <input type="number" class="form-control" id="semanas_gest" name="semanas_gest" 
                                                    min="1" max="45" placeholder="Ej: 28" required>
                                                <div class="invalid-feedback" id="semanas_gestError"></div>
                                            </div>
                                            
                                            <!-- Código Patria -->
                                            <div class="col-md-6 mb-3">
                                                <label for="codigo_patria" class="form-label">
                                                    Código Patria (Opcional)
                                                </label>
                                                <input type="number" class="form-control" id="codigo_patria" name="codigo_patria" 
                                                    placeholder="Código del sistema Patria">
                                                <div class="invalid-feedback" id="codigo_patriaError"></div>
                                            </div>
                                            
                                            <!-- Serial Patria -->
                                            <div class="col-md-6 mb-3">
                                                <label for="serial_patria" class="form-label">
                                                    Serial Patria (Opcional)
                                                </label>
                                                <input type="number" class="form-control" id="serial_patria" name="serial_patria" 
                                                    placeholder="Serial del sistema Patria">
                                                <div class="invalid-feedback" id="serial_patriaError"></div>
                                            </div>
                                            
                                            <!-- Estado -->
                                            <div class="col-md-6 mb-3">
                                                <label for="estado" class="form-label">
                                                    Estado <span class="text-danger">*</span>
                                                </label>
                                                <select name="estado" id="estado" class="form-select" required>
                                                    <option value="" selected disabled>Seleccione estado</option>
                                                    <option value="Activo">Activo</option>
                                                    <option value="Inactivo">Inactivo</option>
                                                    <option value="Finalizado">Finalizado</option>
                                                    <option value="Suspendido">Suspendido</option>
                                                </select>
                                                <div class="invalid-feedback" id="estadoError"></div>
                                            </div>
                                        </div>
                                        
                                        <!-- Botones -->
                                        <div class="text-end mt-auto pt-3">
                                            <button type="button" class="btn btn-outline-secondary" id="btnLimpiarFormularioGestionEmb">
                                                <i class="fas fa-times me-1"></i> Limpiar
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-baby me-1"></i> Registrar Gestión
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <?php include BASE_PATH . '/app/Views/template/footer.php'; ?>
            <!-- End of Footer -->
            
            <!-- Modales -->
            <?php include BASE_PATH . '/app/Views/citas/modales.php'; ?>

        </div>
        <!-- End of Content Wrapper -->

    </div>

   <?php include BASE_PATH . '/app/Views/template/script.php'; ?>

   <!-- JavaScript Modulares para Diagnóstico -->
   

                                                                
</body>
</html>