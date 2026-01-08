<!-- Casos Sociales -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                        Casos Sociales</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $total_casos_soc ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-hands-helping fa-2x text-primary"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Casos del Mes -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                        Casos del Mes</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $casos_mes_soc ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-calendar-day fa-2x text-info"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Familias Atendidas -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                        Familias Atendidas</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $familias_soc ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-users-cog fa-2x text-success"></i>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Seguimiento Social -->
<div class="col-xl-3 col-md-6 mb-4">
    <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
            <div class="row no-gutters align-items-center">
                <div class="col mr-2">
                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                        Seguimiento Social</div>
                    <div class="h5 mb-0 font-weight-bold text-gray-800"><?= $seguimiento_soc ?? 0; ?></div>
                </div>
                <div class="col-auto">
                    <i class="fas fa-home fa-2x text-warning"></i>
                </div>
            </div>
        </div>
    </div>
</div>
