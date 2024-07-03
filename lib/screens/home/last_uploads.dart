import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/scans/all_scans.dart';
import 'package:g3_app_mobile/screens/scans/scan_item.dart';
import 'package:g3_app_mobile/services/scans.services.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class LastUploads extends StatefulWidget {
  const LastUploads({super.key});

  @override
  State<LastUploads> createState() => _LastUploadsState();
}

class _LastUploadsState extends State<LastUploads> {
  List<Scan?> _uploads = [];

  retrieveData([int? limit]) async {
    final res = await getScans(context, limit);
    if (res is String) return showNotification(context, res, "error");
    setState(() {
      _uploads = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderContent() {
      final lastScans = _uploads;
      if (lastScans.isEmpty) {
        return TextButton(
          onPressed: () async => await retrieveData(3),
          child: Text("Cargar datos"),
        );
      }
      final children = (lastScans)
          .map<Widget>((u) => ScanItem(
                url: u?.url,
              ))
          .toList();
      return Row(
        children: children.toList(),
      );
    }

    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Últimas subidas",
                style: headline3,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AllScans()));
                  },
                  child: Text("Ver todas")),
            ],
          ),
          renderContent(),
        ],
      ),
    );
  }
}
