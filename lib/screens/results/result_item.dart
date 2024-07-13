import 'package:flutter/material.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class ResultItem extends StatelessWidget {
  final Result result;
  const ResultItem({super.key, required this.result});

  Color getColor() {
    return result.hasCancer ? Colors.black : Colors.white;
  }

  Color getTextColor() {
    return result.hasCancer ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: getColor(), borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(result.scanUrl),
            ),
            Text(
              result.hasCancer ? "Positivo" : "Negativo",
              style: TextStyle(color: getTextColor()),
            ),
            Text(formatDateString(result.updatedAt),
                style: TextStyle(color: getTextColor())),
          ],
        ));
  }
}
