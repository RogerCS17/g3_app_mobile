import 'package:flutter/material.dart';
import 'package:g3_app_mobile/auth.dart';
import 'package:g3_app_mobile/screens/home/identifier.dart';
import 'package:g3_app_mobile/screens/home/last_results.dart';
import 'package:g3_app_mobile/screens/home/last_uploads.dart';
import 'package:g3_app_mobile/screens/login/login.dart';
import 'package:g3_app_mobile/screens/scans/scans.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Bienvenido"), Identifier()],
              ),
              IconButton(
                  onPressed: () {
                    logout(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.door_back_door))
            ],
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 24),
            color: Colors.deepPurple.shade200,
            child: const Column(
              children: [
                SizedBox(height: 16),
                LastUploads(),
                SizedBox(height: 48),
                LastResults()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScansScreen()));
          },
          child: const Icon(Icons.add),
        ));
  }
}
