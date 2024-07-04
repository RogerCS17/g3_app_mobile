import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/scans/scan_item.dart';
import 'package:g3_app_mobile/services/scans.services.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class AllScans extends StatefulWidget {
  const AllScans({super.key});

  @override
  State<AllScans> createState() => _AllScansState();
}

class _AllScansState extends State<AllScans> {
  List<Scan?> _uploads = [];

  retrieveData() async {
    final res = await getScans(context);
    if (res is String) return showNotification(context, res, "error");
    setState(() {
      _uploads = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> renderContent() {
      if (_uploads.isEmpty) {
        return [
          TextButton(
            onPressed: () async => await retrieveData(),
            child: const Text("Cargar datos"),
          ),
        ];
      }

      return _uploads.map<Widget>((u) => ScanItem(url: u?.url)).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todas las muestras"),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        color: Colors.deepPurple.shade200,
        child: GridView.count(
          crossAxisCount: 3,
          children: renderContent(),
        ),
      ),
    );
  }
}
