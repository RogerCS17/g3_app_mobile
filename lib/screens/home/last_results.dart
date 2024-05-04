import 'package:flutter/material.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/widgets/last_result_item.dart';

class LastResults extends StatelessWidget {
  const LastResults({super.key});

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
            children: const [
              LastResultItem(
                result: "Resultado 1",
                isLast: true,
              ),
              LastResultItem(result: "Resultado 2"),
              LastResultItem(result: "Resultado 3"),
              TextButton(onPressed: null, child: Text("Ver Todos"))
            ],
          ),
        ],
      ),
    );
  }
}
