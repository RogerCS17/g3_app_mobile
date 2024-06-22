import 'dart:io';

import 'package:flutter/material.dart';
import 'package:g3_app_mobile/models/scans.model.dart';
import 'package:g3_app_mobile/screens/scans/scans.helpers.dart';
import 'package:provider/provider.dart';

class MiniScan extends StatefulWidget {
  final int id;
  const MiniScan({super.key, required this.id});

  @override
  State<MiniScan> createState() => _MiniScanState();
}

class _MiniScanState extends State<MiniScan> {
  File? _img;

  openGallery() async {
    final img = await pickImageFromGallery();
    if (img == null) return;
    setState(() {
      _img = File(img!.path);
      Provider.of<ScanModel>(context, listen: false)
          .setScan(File(img!.path), widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: openGallery,
        child: (_img != null
            ? SizedBox(width: 48, height: 48, child: Image.file(_img!))
            : Container(
                color: Colors.white,
                width: 48,
                height: 48,
              )));
  }
}
