import 'package:flutter/material.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class LastResultItem extends StatelessWidget {
  final Result? result;
  final bool isLast;
  const LastResultItem({super.key, required this.result, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    var color = isLast ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: isLast ? Colors.deepPurple : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(isLast ? Icons.doorbell : Icons.file_copy_outlined,
                  color: color),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDateString(result?.updatedAt ?? ""),
                    style: TextStyle(color: color),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      "#${result?.id}",
                      style: TextStyle(color: color, fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
