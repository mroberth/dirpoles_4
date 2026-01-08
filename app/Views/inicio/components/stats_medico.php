<!-- Consultas Médicas -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Consultas Totales</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $total_consultas_med ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-notes-medical fa-2x text-primary"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Consultas del Mes -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                        Consultas del Mes</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $consultas_mes_med ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-clock fa-2x text-info"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Pacientes Atendidos -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        Pacientes Atendidos</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $pacientes_med ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-procedures fa-2x text-success"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Casos Activos -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                        Casos Activos</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $casos_activos_med ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-heartbeat fa-2x text-danger"></i>
                </div>
            </div>
        </div>
    </div>
</div>
