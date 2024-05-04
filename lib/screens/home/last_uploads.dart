import 'package:flutter/material.dart';
import 'package:g3_app_mobile/styles.dart';

class LastUploads extends StatelessWidget {
  const LastUploads({super.key});

  @override
  Widget build(BuildContext context) {
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
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
              SizedBox(width: 16),
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
              SizedBox(width: 16),
              Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
