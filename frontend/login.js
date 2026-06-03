const btnLogin = document.getElementById('btnLogin');

const API_BASE = 'http://localhost:3000';

if (btnLogin) {
    btnLogin.addEventListener('click', async (event) => {
        event.preventDefault();

        const usuario = document.getElementById('usuario').value.trim();
        const password = document.getElementById('password').value.trim();

        if (!usuario || !password) {
            alert('Ingrese usuario y contraseña');
            return;
        }

        try {
            const respuesta = await fetch(`${API_BASE}/api/auth/login`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    usuario,
                    password
                })
            });

            const texto = await respuesta.text();

            let data;

            try {
                data = JSON.parse(texto);
            } catch (error) {
                console.error('Respuesta no JSON:', texto);

                alert(
                    'El servidor no respondió con JSON válido. Revisa que app.js tenga app.use("/api/auth", authRoutes).'
                );
                return;
            }

            if (!respuesta.ok) {
                alert(data.mensaje || 'No se pudo iniciar sesión');
                return;
            }

            localStorage.setItem('token', data.token || '');
            localStorage.setItem('usuario', data.usuario || usuario);
            localStorage.setItem('nombre', data.nombre || '');
            localStorage.setItem('correo', data.correo || '');
            localStorage.setItem('rol', data.rol || '');

            alert('Bienvenido al sistema');

            window.location.href = 'dashboard.html';

        } catch (error) {
            console.error('Error en login:', error);

            alert('Error al conectar con el servidor');
        }
    });
}
