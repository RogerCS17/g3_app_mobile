import 'dart:io';

import 'package:flutter/material.dart';
import 'package:g3_app_mobile/models/scans.model.dart';
import 'package:g3_app_mobile/screens/scans/scans.helpers.dart';
import 'package:provider/provider.dart';

class MainScan extends StatefulWidget {
  const MainScan({super.key});

  @override
  State<MainScan> createState() => _MainScanState();
}

class _MainScanState extends State<MainScan> {
  File? _img;

  openGallery() async {
    final img = await pickImageFromGallery();
    if (img == null) return;
    setState(() {
      _img = File(img!.path);
      Provider.of<ScanModel>(context, listen: false)
          .setScan(File(img!.path), 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openGallery,
      child: _img != null
          ? SizedBox(
              width: 256,
              height: 256,
              child: Image.file(_img!),
            )
          : Container(
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
    );
  }
}
