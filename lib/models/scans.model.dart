import 'dart:io';

import 'package:flutter/foundation.dart';

class ScanModel extends ChangeNotifier {
  File? mainScan;

  File? miniScan1;
  File? miniScan2;
  File? miniScan3;

  List<File?> get scans => [mainScan, miniScan1, miniScan2, miniScan3];

  void setScan(File scan, int index) {
    switch (index) {
      case 0:
        mainScan = scan;
        break;
      case 1:
        miniScan1 = scan;
        break;
      case 2:
        miniScan2 = scan;
        break;
      case 3:
        miniScan3 = scan;
        break;
    }
    notifyListeners();
  }
}
