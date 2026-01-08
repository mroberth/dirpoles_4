document.addEventListener('DOMContentLoaded', function () {
    try {
        const current = window.location.pathname + window.location.search; // ruta actual
        // seleccionar todas las collapse-items
        const items = document.querySelectorAll('#accordionSidebar .collapse-item');

        items.forEach(a => {
            const href = a.getAttribute('href');
            if (!href) return;
            // comparación básica: si la URL del item está incluida en la URL actual
            if (current.indexOf(href) !== -1 || (href !== '/' && current.endsWith(href))) {
                // marcar activo
                a.classList.add('active');
                // expandir el collapse padre si existe
                const collapse = a.closest('.collapse');
                if (collapse) {
                    // usar la API de bootstrap 5 si está disponible
                    if (window.bootstrap && bootstrap.Collapse) {
                        let inst = bootstrap.Collapse.getOrCreateInstance(collapse, { toggle: false });
                        inst.show();
                    } else {
                        collapse.classList.add('show');
                    }
                }
                // opcional: marcar el nav-link padre como active
                const parentNavLink = a.closest('.nav-item')?.querySelector('.nav-link');
                if (parentNavLink) parentNavLink.classList.add('active');
            }
        });
    } catch (e) {
        console.error('sidebar-active error', e);
    }
});
