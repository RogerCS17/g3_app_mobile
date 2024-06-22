abstract class Scan {
  String get id;
  String get userId;
  String get url;

  set id(String id);
  set userId(String userId);
  set url(String url);
}

class ScanOrString {
  final Scan? scan;
  final String? string;

  ScanOrString({this.scan, this.string});
}
