const API_URL = 'http://localhost:3000/api/familias';

const formFamilia = document.getElementById('formFamilia');
const btnLimpiar = document.getElementById('btnLimpiar');
const btnActualizar = document.getElementById('btnActualizar');
const btnGuardarSuperior = document.getElementById('btnGuardarSuperior');

const cuerpoTabla = document.getElementById('cuerpoTabla');
const emptyTable = document.getElementById('emptyTable');

const totalFamilias = document.getElementById('totalFamilias');
const totalActivas = document.getElementById('totalActivas');
const totalSuspendidas = document.getElementById('totalSuspendidas');

document.addEventListener('DOMContentLoaded', () => {
    colocarFechaActual();
    cargarFamilias();
});

function colocarFechaActual() {
    const fechaInput = document.getElementById('fecha_registro');

    if (fechaInput && !fechaInput.value) {
        const hoy = new Date().toISOString().split('T')[0];
        fechaInput.value = hoy;
    }
}

if (btnLimpiar) {
    btnLimpiar.addEventListener('click', () => {
        formFamilia.reset();
        colocarFechaActual();
    });
}

if (btnActualizar) {
    btnActualizar.addEventListener('click', () => {
        cargarFamilias();
    });
}

if (btnGuardarSuperior) {
    btnGuardarSuperior.addEventListener('click', () => {
        formFamilia.requestSubmit();
    });
}

if (formFamilia) {
    formFamilia.addEventListener('submit', async (event) => {
        event.preventDefault();

        const data = {
            nombre_jefe: document.getElementById('nombre_jefe').value.trim(),
            dpi: document.getElementById('dpi').value.trim(),
            telefono: document.getElementById('telefono').value.trim(),
            correo: document.getElementById('correo').value.trim(),
            sector: document.getElementById('sector').value,
            estado: document.getElementById('estado').value,
            direccion: document.getElementById('direccion').value.trim(),
            fecha_registro: document.getElementById('fecha_registro').value
        };

        if (!data.nombre_jefe || !data.dpi) {
            alert('El nombre del jefe de familia y el DPI son obligatorios.');
            return;
        }

        try {
            const respuesta = await fetch(API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            });

            const resultado = await respuesta.json();

            if (!respuesta.ok) {
                alert(resultado.mensaje || 'No se pudo registrar la familia.');
                return;
            }

            alert('Familia registrada correctamente.');

            formFamilia.reset();
            colocarFechaActual();
            cargarFamilias();

        } catch (error) {
            console.error('Error al registrar familia:', error);

            alert(
                'No se pudo conectar con el servidor. ' +
                'Revisa que el backend esté encendido en http://localhost:3000'
            );
        }
    });
}

async function cargarFamilias() {
    try {
        const respuesta = await fetch(API_URL);

        if (!respuesta.ok) {
            throw new Error('No se pudieron obtener las familias');
        }

        const familias = await respuesta.json();

        cuerpoTabla.innerHTML = '';

        if (!Array.isArray(familias) || familias.length === 0) {
            mostrarTablaVacia();

            totalFamilias.textContent = '0';
            totalActivas.textContent = '0';
            totalSuspendidas.textContent = '0';

            return;
        }

        ocultarTablaVacia();

        let activas = 0;
        let suspendidas = 0;

        familias.forEach((familia) => {
            if (familia.estado === 'Activa') {
                activas++;
            }

            if (familia.estado === 'Suspendida' || familia.estado === 'Suspendido') {
                suspendidas++;
            }

            const fila = document.createElement('tr');

            fila.innerHTML = `
                <td>${familia.id}</td>
                <td>${familia.nombre_jefe}</td>
                <td>${familia.dpi}</td>
                <td>${familia.telefono || ''}</td>
                <td>${familia.correo || 'Sin correo'}</td>
                <td>${familia.sector || ''}</td>
                <td>${familia.estado || 'Activa'}</td>
                <td>${formatearFecha(familia.fecha_registro)}</td>
            `;

            cuerpoTabla.appendChild(fila);
        });

        totalFamilias.textContent = familias.length;
        totalActivas.textContent = activas;
        totalSuspendidas.textContent = suspendidas;

    } catch (error) {
        console.error('Error al cargar familias:', error);

        cuerpoTabla.innerHTML = '';

        mostrarTablaVacia('No se pudieron cargar las familias');

        totalFamilias.textContent = '0';
        totalActivas.textContent = '0';
        totalSuspendidas.textContent = '0';
    }
}

function mostrarTablaVacia(mensaje = 'No hay familias registradas disponibles') {
    if (emptyTable) {
        emptyTable.style.display = 'flex';
        emptyTable.innerHTML = `<p>${mensaje}</p>`;
    }
}

function ocultarTablaVacia() {
    if (emptyTable) {
        emptyTable.style.display = 'none';
    }
}

function formatearFecha(fecha) {
    if (!fecha) {
        return '';
    }

    const nuevaFecha = new Date(fecha);

    if (isNaN(nuevaFecha.getTime())) {
        return fecha;
    }

    return nuevaFecha.toLocaleDateString('es-GT');
}
