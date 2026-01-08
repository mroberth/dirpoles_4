<!-- Diagnósticos Atendidos -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Diagnósticos Atendidos</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $diagnosticos_discapacidad ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-wheelchair fa-2x text-primary"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Beneficiarios Referidos -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                        Ref. Recibidas</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $referidos_discapacidad ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-file-export fa-2x text-info"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Pacientes con Carnet -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        Pacientes con Carnet</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $carnet_discapacidad ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-id-card fa-2x text-success"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Total Discapacidad -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                        Beneficiarios Área</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $beneficiarios_discapacidad ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-user-tag fa-2x text-warning"></i>
                </div>
            </div>
        </div>
    </div>
</div>
