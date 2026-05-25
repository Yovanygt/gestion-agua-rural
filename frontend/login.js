const btnLogin = document.getElementById('btnLogin');

btnLogin.addEventListener('click', async () => {

    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;

    try {

        const respuesta = await fetch('http://localhost:3000/api/auth/login', {

            method: 'POST',

            headers: {
                'Content-Type': 'application/json'
            },

            body: JSON.stringify({
                usuario,
                password
            })

        });

        const data = await respuesta.json();

        console.log(data);

        if (!respuesta.ok) {

            alert(data.mensaje);
            return;

        }

        // GUARDAR TOKEN
        localStorage.setItem('token', data.token);

        // GUARDAR USUARIO
        localStorage.setItem('usuario', data.usuario);

        // GUARDAR NOMBRE
        localStorage.setItem('nombre', data.nombre);

        // GUARDAR ROL
        localStorage.setItem('rol', data.rol);

        alert('Bienvenido al sistema');

        // REDIRECCION
        window.location.href = 'dashboard.html';

    } catch (error) {

        console.log(error);

        alert('Error al conectar con el servidor');

    }

});