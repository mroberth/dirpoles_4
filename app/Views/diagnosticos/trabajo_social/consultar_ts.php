<?php 
$titulo = "Consultar Diagnósticos";
include 'app/Views/template/head.php';
$es_admin = in_array($_SESSION['tipo_empleado'], ['Administrador', 'Superusuario']);
?>

<script>
    window.esAdmin = <?= json_encode($es_admin) ?>;
</script>

<body id="page-top">
    <div id="wrapper">
        <?php include 'app/Views/template/sidebar.php'; ?>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <?php include 'app/Views/template/header.php'; ?>

                <div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Gestionar Diagnósticos de Trabajo Social</h1>
                        <a href="<?= BASE_URL ?>pdf/reporte_ts" target="_blank" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                            <i class="fas fa-download fa-sm text-white-50"></i> Generar Reporte
                        </a>
                    </div>

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <ul class="nav nav-tabs card-header-tabs" id="tsTabs" role="tablist">
                                <li class="nav-item">
                                    <button class="nav-link active" id="becas-tab" data-bs-toggle="tab" data-bs-target="#becas" type="button" role="tab" onclick="cargarTabla('becas')">
                                        <i class="fas fa-graduation-cap me-2 text-primary"></i>Becas
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" id="exoneraciones-tab" data-bs-toggle="tab" data-bs-target="#exoneraciones" type="button" role="tab" onclick="cargarTabla('exoneraciones')">
                                        <i class="fas fa-file-invoice-dollar me-2 text-warning"></i>Exoneraciones
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" id="fames-tab" data-bs-toggle="tab" data-bs-target="#fames" type="button" role="tab" onclick="cargarTabla('fames')">
                                        <i class="fas fa-hand-holding-heart me-2 text-danger"></i>FAMES
                                    </button>
                                </li>
                                <li class="nav-item">
                                    <button class="nav-link" id="embarazadas-tab" data-bs-toggle="tab" data-bs-target="#embarazadas" type="button" role="tab" onclick="cargarTabla('embarazadas')">
                                        <i class="fas fa-baby me-2 text-info"></i>Embarazadas
                                    </button>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="tsTabsContent">
                                <!-- Tabla General (Se reconstruye dinámicamente) -->
                                <div class="table-responsive">
                                    <table id="tabla_ts" class="table table-bordered table-striped" width="100%" cellspacing="0">
                                        <thead>
                                            <!-- Se llena dinámicamente -->
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <?php include 'app/Views/template/footer.php'; ?>
        </div>
    </div>

    <?php include 'app/Views/template/script.php'; ?>
    
    <script>
        let tablaTS;
        const BASE_URL = "<?= BASE_URL ?>";

        document.addEventListener('DOMContentLoaded', function() {
            cargarTabla('becas'); // Cargar por defecto
        });

        function cargarTabla(tipo) {
            // Destruir tabla previa si existe
            if ($.fn.DataTable.isDataTable('#tabla_ts')) {
                $('#tabla_ts').DataTable().destroy();
                $('#tabla_ts').empty(); 
            }

            let columnas = [];

            // Definir columnas según el tipo
            // IMPORTANTE: Todas las columnas que usen render con 'row' deben tener Data: null para evitar error de DataTables
            if(tipo === 'becas') {
                columnas = [
                    { title: "ID", data: "id_becas" },
                    { title: "Beneficiario", data: null, render: function(data, type, row) {
                        return `${row.nombres} ${row.apellidos}<br><small>${row.tipo_cedula}-${row.cedula}</small>`;
                    }},
                    { title: "Banco", data: "tipo_banco" },
                    { title: "Cuenta", data: "cta_bcv" },
                    { title: "Empleado", data: null, render: function(data, type, row) {
                        return `<small>${row.empleado_nombre} ${row.empleado_apellido}</small>`; 
                    }},
                    { title: "PDF", data: null, render: function(data, type, row) {
                        return row.direccion_pdf ? `<a href="${BASE_URL}${row.direccion_pdf}" target="_blank" class="btn btn-sm btn-danger"><i class="fas fa-file-pdf"></i></a>` : '-';
                    }}
                ];
            } else if(tipo === 'exoneraciones') {
                columnas = [
                    { title: "ID", data: "id_exoneracion" },
                    { title: "Beneficiario", data: null, render: function(data, type, row) {
                        return `${row.nombres} ${row.apellidos}<br><small>${row.tipo_cedula}-${row.cedula}</small>`;
                    }},
                    { title: "Motivo", data: null, render: function(data, type, row) {
                        return row.motivo === 'Otro' ? row.otro_motivo : row.motivo;
                    }},
                    { title: "Fecha", data: "fecha_creacion" },
                    { title: "Docs", data: null, render: function(data, type, row) {
                        let html = '';
                        if(row.direccion_carta) html += `<a href="${BASE_URL}${row.direccion_carta}" target="_blank" class="btn btn-sm btn-primary me-1" title="Carta"><i class="fas fa-envelope"></i></a>`;
                        if(row.direccion_estudiose) html += `<a href="${BASE_URL}${row.direccion_estudiose}" target="_blank" class="btn btn-sm btn-info text-white" title="Estudio SE"><i class="fas fa-file-invoice-dollar"></i></a>`;
                        return html;
                    }}
                ];
            } else if(tipo === 'fames') {
                columnas = [
                    { title: "ID", data: "id_fames" },
                    { title: "Beneficiario", data: null, render: function(data, type, row) {
                        return `${row.nombres} ${row.apellidos}<br><small>${row.tipo_cedula}-${row.cedula}</small>`;
                    }},
                    { title: "Patología", data: "nombre_patologia" },
                    { title: "Ayuda", data: null, render: function(data, type, row) {
                        return row.tipo_ayuda === 'Otro' ? row.otro_tipo : row.tipo_ayuda;
                    }},
                    { title: "Fecha", data: "fecha_creacion" }
                ];
            } else if(tipo === 'embarazadas') {
                columnas = [
                    { title: "ID", data: "id_gestion" },
                    { title: "Beneficiario", data: null, render: function(data, type, row) {
                        return `${row.nombres} ${row.apellidos}<br><small>${row.tipo_cedula}-${row.cedula}</small>`;
                    }},
                    { title: "Semanas", data: "semanas_gest" },
                    { title: "Código Patria", data: "codigo_patria" },
                    { title: "Estado", data: null, render: function(data, type, row) { 
                        let color = row.estado === 'En proceso' ? 'warning' : 'success';
                        return `<span class="badge bg-${color}">${row.estado}</span>`;
                    }}
                ];
            }

            // Inicializar DataTable
            tablaTS = $('#tabla_ts').DataTable({
                ajax: {
                    url: `consultar_diagnosticos_json?tipo=${tipo}`,
                    dataSrc: function(json) {
                        if(!json.exito) {
                            console.error(json.mensaje);
                            return [];
                        }
                        return json.data;
                    }
                },
                layout: {
                    topStart: {
                        buttons: [
                            {
                                extend: 'excel',
                                text: '<i class="fas fa-file-excel"></i> Excel',
                                className: 'btn btn-success',
                                exportOptions: {
                                    columns: ':visible',
                                    format: {
                                        body: function (data, row, column, node) {
                                            return data.replace(/<[^>]*>/g, '');
                                        }
                                    }
                                }
                            },
                            {
                                extend: 'pdf',
                                text: '<i class="fas fa-file-pdf"></i> PDF',
                                className: 'btn btn-danger',
                                orientation: 'landscape',
                                pageSize: 'A4',
                                exportOptions: {
                                    columns: ':visible',
                                    stripHtml: true
                                },
                            }
                        ]
                    },
                },
                columns: columnas,
                ordering: true,
                order: [[0, 'desc']],
                pageLength: 10,
                lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "Todos"]],
                language: {
                    url: 'plugins/DataTables/js/languaje.json'
                },
                responsive: true,
                autoWidth: false
            });
        }
    </script>
</body>
</html>