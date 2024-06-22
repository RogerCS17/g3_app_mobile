import 'package:flutter/material.dart';
import 'package:g3_app_mobile/services/scans.services.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/types.dart';

class LastUploads extends StatefulWidget {
  const LastUploads({super.key});

  @override
  State<LastUploads> createState() => _LastUploadsState();
}

class _LastUploadsState extends State<LastUploads> {
  List<Scan?> _uploads = [];

  retrieveData() async {
    final res = await getScans(context);
    if (res is String) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
        backgroundColor: Colors.red,
      ));
    }
    setState(() {
      _uploads = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderContent() {
      final lastScans = _uploads.take(3).toList();
      if (lastScans.isEmpty) {
        return TextButton(
          onPressed: () async => await retrieveData(),
          child: Text("Cargar datos"),
        );
      }
      final children = (lastScans)
          .map<Widget>((u) => u?.url != null
              ? SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(u?.url ?? ""),
                )
              : Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Últimas subidas",
                style: headline3,
              ),
              TextButton(onPressed: null, child: Text("Ver todas")),
            ],
          ),
          renderContent(),
        ],
      ),
    );
  }
}
