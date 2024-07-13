import 'package:flutter/material.dart';
import 'package:g3_app_mobile/screens/results/all_results.dart';
import 'package:g3_app_mobile/services/results.services.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';
import 'package:g3_app_mobile/widgets/last_result_item.dart';

class LastResults extends StatefulWidget {
  const LastResults({super.key});

  @override
  State<LastResults> createState() => _LastResultsState();
}

class _LastResultsState extends State<LastResults> {
  List<Result?> _results = [];

  retrieveData([int? limit]) async {
    final res = await getResults(context, limit);
    if (res is String) return showNotification(context, res, "error");
    setState(() {
      _results = res;
    });
  }

  List<Widget> renderContent() {
    final lastResults = _results;
    if (lastResults.isEmpty) {
      return [
        Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: () async => await retrieveData(3),
                child: Text("Cargar datos")))
      ].toList();
    }
    final children = (lastResults)
        .map<Widget>((r) => LastResultItem(
              result: r,
            ))
        .toList();
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          const Text(
            "Últimos resultados",
            style: headline3,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ...renderContent(),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllResults()));
                    },
                    child: Text("Ver Todos")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
