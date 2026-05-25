const btnLogin = document.getElementById('btnLogin');

btnLogin.addEventListener('click', async () => {

    const usuario = document.getElementById('usuario').value;
    const password = document.getElementById('password').value;

    console.log(usuario);
    console.log(password);

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

        alert('Login funcionando');

    } catch (error) {

        console.log(error);

        alert('Error conexión servidor');

    }

});