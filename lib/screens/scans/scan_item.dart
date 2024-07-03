import 'package:flutter/material.dart';

class ScanItem extends StatelessWidget {
  final String? url;

  const ScanItem({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return url != null
        ? SizedBox(
            width: 100,
            height: 100,
            child: Image.network(url ?? ""),
          )
        : Container(
            width: 100,
            height: 100,
            color: Colors.grey,
          );
  }
}
