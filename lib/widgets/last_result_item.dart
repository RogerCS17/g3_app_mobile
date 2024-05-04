import 'package:flutter/material.dart';

class LastResultItem extends StatelessWidget {
  final String result;
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
                    result,
                    style: TextStyle(color: color),
                  ),
                  Text(
                    "23 de enero, 2024",
                    style: TextStyle(color: color),
                  ),
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward, color: color)
        ],
      ),
    );
  }
}
