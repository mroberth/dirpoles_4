<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Buscar..."
                aria-label="Buscar" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-end p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small"
                            placeholder="Search for..." aria-label="Search"
                            aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>


        <!-- Nav Item - Alerts -->
        <li class="nav-item dropdown no-arrow mx-1 position-relative">
            <a class="nav-link dropdown-toggle p-0" href="#" id="notificationDropdown" role="button"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-lg text-gray-500"></i>
                <span id="notificationCounter" class="translate-middle badge rounded-pill bg-danger">
                    <sup id="notificationCount">0</sup>
                    <span class="visually-hidden">notificaciones sin leer</span>
                </span>
            </a>
            <div id="notificationMenu" class="dropdown-menu dropdown-menu-end shadow animated--grow-in p-0" 
                aria-labelledby="notificationDropdown" style="width: 360px;">
                <div class="dropdown-header d-flex justify-content-between align-items-center bg-primary text-white py-3 px-4 rounded-top">
                    <h6 class="mb-0 text-white" id="notificationHeader">
                        <i class="fas fa-bell me-2"></i>Notificaciones
                    </h6>
                    <span class="badge bg-light text-primary" id="notificationCounterBadge">0</span>
                </div>
                <div id="notificationScrollWrapper" style="max-height: 400px; overflow-y: auto;" class="py-2">
                    <div id="notificationItems" class="px-2">
                        <!-- Las notificaciones se cargarán aquí dinámicamente -->
                    </div>
                    <div id="loading-spinner" class="text-center py-3" style="display: none;">
                        <div class="spinner-border spinner-border-sm text-primary" role="status">
                            <span class="visually-hidden">Cargando...</span>
                        </div>
                    </div>
                </div>
                <div class="dropdown-footer text-center py-2 border-top">
                    <a href="#" id="markAllRead" class="text-decoration-none small text-primary">
                        <i class="fas fa-check-circle me-1"></i>Marcar todas como leídas
                    </a>
                </div>
            </div>
            <div id="user_id" data-id="<?php echo $_SESSION['id_empleado']; ?>" style="display: none;"></div>
        </li>


        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><?= $_SESSION['nombre'] . ' ' . $_SESSION['apellido']; ?></span>
                <img class="img-profile rounded-circle"
                    src="<?= BASE_URL. '/dist/img/user_img.jpg'; ?>">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Perfil
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    Configuración
                </a>
                <a class="dropdown-item" href="#">
                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                    Registro de Actividad
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item js-logout" href="<?= BASE_URL ?>logout" data-logout>
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Cerrar Sesión
                </a>
            </div>
        </li>
    </ul>
</nav>

<style>
    /* Estilos específicos para notificaciones */
.notification-item {
    transition: all 0.2s ease;
    border-bottom: 1px solid #f0f0f0;
}

.notification-item:last-child {
    border-bottom: none;
}

.notification-item:hover {
    background-color: #f8f9fa;
}

.notification-item.unread {
    background-color: rgba(78, 115, 223, 0.05);
}

.hover-bg-gray-100:hover {
    background-color: #f8f9fa !important;
}

/* Colores adicionales */
.bg-purple {
    background-color: #6f42c1 !important;
}

.bg-indigo {
    background-color: #6610f2 !important;
}

/* Badge con pulso */
.badge-pulse {
    animation: pulse 1.5s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* Scrollbar personalizado */
#notificationScrollWrapper::-webkit-scrollbar {
    width: 6px;
}

#notificationScrollWrapper::-webkit-scrollbar-track {
    background: #f1f1f1;
    border-radius: 10px;
}

#notificationScrollWrapper::-webkit-scrollbar-thumb {
    background: #c1c1c1;
    border-radius: 10px;
}

#notificationScrollWrapper::-webkit-scrollbar-thumb:hover {
    background: #a8a8a8;
}


/* Asegurar que el dropdown tenga z-index adecuado */
#notificationMenu {
    z-index: 1050; /* Bootstrap dropdown normal tiene 1000, modals 1060 */
}

/* SweetAlert overlay no debe afectar al dropdown */
.swal2-container {
    z-index: 1060; /* Mayor que el dropdown */
}

/* Clase para mantener dropdown abierto */
.dropdown-menu.show {
    z-index: 1050 !important;
}
</style>
