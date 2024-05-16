import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/login/login_form.dart';
import 'package:g3_app_mobile/screens/sign_up/sign_up.dart';
import 'package:g3_app_mobile/styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final heightSelector = MediaQuery.of(context).size.height / 5;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // Contenedor para establecer el color de fondo
        color: Color.fromARGB(255, 181, 186, 233), // Color de fondo de la pantalla
        child: Center(
          child: ListView(
            // Utilizamos un ListView para permitir el desplazamiento
            shrinkWrap: true,
            children: [
              SizedBox(height: 20), // Espacio entre la parte superior de la pantalla y la imagen
              Center(
                child: Image.asset(
                  "assets/logo_app.png",
                  height: heightSelector,
                ),
              ),
              SizedBox(height: 20), // Espacio entre la imagen y el formulario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Bienvenido a MediTrack", style: headline1),
                    const SizedBox(height: 24),
                    Container(
                      // Contenedor del formulario de inicio de sesión
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10), // Agregar un borde redondeado
                      ),
                      child: Column(
                        children: [
                          const LoginForm(),
                          const SizedBox(height: 24),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                              );
                            },
                            child: const Text("¿No tienes una cuenta? Regístrate"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
