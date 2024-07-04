import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:g3_app_mobile/models/scans.model.dart';
import 'package:g3_app_mobile/screens/scans/main_scan.dart';
import 'package:g3_app_mobile/screens/scans/mini_scan.dart';
import 'package:g3_app_mobile/screens/scans/scans_success.dart';
import 'package:g3_app_mobile/services/scans.services.dart';
import 'package:provider/provider.dart';
import 'package:g3_app_mobile/utils.dart';

class ScansScreen extends StatelessWidget {
  const ScansScreen({super.key});

  uploadScan(List<int> bytes, BuildContext context) async {
    var res = await postScan(base64Encode(bytes), context);
    if (!res.isEmpty) {
      return showNotification(context, res, "error");
    }
    // TODO: get model prediction
    // TODO: save model prediction to DB with postResult
  }

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
            MainScan(),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: const [
                MiniScan(id: 1),
                SizedBox(
                  width: 8,
                ),
                MiniScan(id: 2),
                SizedBox(
                  width: 8,
                ),
                MiniScan(id: 3),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            ElevatedButton(
              onPressed: () async {
                final scans =
                    Provider.of<ScanModel>(context, listen: false).scans;

                try {
                  if (scans.every((s) => s == null)) {
                    return showNotification(
                        context, "No hay muestras para subir", "warning");
                  }

                  for (final scan in scans) {
                    if (scan != null) {
                      List<int> bytes = scan.readAsBytesSync();
                      await uploadScan(bytes, context);
                    }
                  }

                  Provider.of<ScanModel>(context, listen: false).reset();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScansSuccess()));
                } catch (e) {
                  print(e);
                }
              },
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
