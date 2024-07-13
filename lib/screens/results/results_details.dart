import 'package:flutter/material.dart';
import 'package:g3_app_mobile/styles.dart';
import 'package:g3_app_mobile/types.dart';
import 'package:g3_app_mobile/utils.dart';

class ResultsDetails extends StatefulWidget {
  final Result? result;
  const ResultsDetails({super.key, this.result});

  @override
  State<ResultsDetails> createState() => _ResultsDetailsState();
}

class _ResultsDetailsState extends State<ResultsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalle de resultados"),
          backgroundColor: Colors.deepPurple,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          color: Colors.deepPurple.shade200,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.file_copy_outlined),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Evaluación de resultados",
                                style: headline3,
                              ),
                              Text(formatDateString(
                                  widget.result?.updatedAt ?? ""))
                            ],
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: null,
                          icon: Icon(Icons.keyboard_arrow_down))
                    ],
                  )
                ],
              ),
            ),
          ),
        )));
  }
}
