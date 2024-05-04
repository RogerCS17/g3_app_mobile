import 'package:flutter/material.dart';

class ScansScreen extends StatelessWidget {
  const ScansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva muestra"),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.deepPurple.shade200,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 96),
              color: Colors.white,
              child: const Column(
                children: [
                  Icon(Icons.camera_alt_outlined, size: 48),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Presiona aquí para subir una nueva muestra desde la cámara o galería",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Container(
                  color: Colors.white,
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  color: Colors.white,
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  color: Colors.white,
                  width: 48,
                  height: 48,
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Subir"),
            ),
            const Text(
              "Al subir una muestra, aceptas los términos de uso y políticas de privacidad.",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
