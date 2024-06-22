import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:g3_app_mobile/screens/home/home.dart';

class ScansSuccess extends StatelessWidget {
  const ScansSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle_outline,
              size: 128,
              color: Colors.white,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "¡Muestras subidas con éxito!",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
