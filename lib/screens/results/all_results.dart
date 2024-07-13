import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/results/result_item.dart';
import 'package:g3_app_mobile/services/results.services.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class AllResults extends StatefulWidget {
  const AllResults({super.key});

  @override
  State<AllResults> createState() => _AllResultsState();
}

class _AllResultsState extends State<AllResults> {
  List<Result> _results = [];

  retrieveData() async {
    final res = await getResults(context);
    if (res is String) return showNotification(context, res, "error");
    setState(() {
      _results = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> renderContent() {
      if (_results.isEmpty) {
        return [
          TextButton(
            onPressed: () async => await retrieveData(),
            child: const Text("Cargar datos"),
          ),
        ];
      }
      return _results
          .map<Widget>((r) => ResultItem(
                result: r,
              ))
          .toList();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Todos los resultados"),
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
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: renderContent(),
          ),
        ));
  }
}
