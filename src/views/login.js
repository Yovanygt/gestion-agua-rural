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

        if (data.ok) {

            alert('Login correcto');

            localStorage.setItem('token', data.token);

        } else {

            alert(data.message);

        }

    } catch (error) {

        console.log(error);

        alert('Error conectando con el servidor');

    }

});