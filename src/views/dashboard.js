fetch('http://localhost:3000/dashboard/resumen')

.then(res => res.json())

.then(data => {

    document.getElementById('familias').innerText =
        data.familias;

    document.getElementById('incidencias').innerText =
        data.incidencias;
});