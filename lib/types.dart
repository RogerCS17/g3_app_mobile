abstract class Scan {
  String get id;
  String get userId;
  String get url;

  set id(String id);
  set userId(String userId);
  set url(String url);
}

class ScanImpl implements Scan {
  @override
  final String id;

  @override
  final String userId;

  @override
  final String url;

  ScanImpl({required this.id, required this.userId, required this.url});

  @override
  set id(String id) {
    id = id;
  }

  @override
  set userId(String userId) {
    userId = userId;
  }

  @override
  set url(String url) {
    url = url;
  }

  factory ScanImpl.fromJson(Map<String, dynamic> json) {
    return ScanImpl(
      id: json['id'],
      userId: json['userId'],
      url: json['url'],
    );
  }
}
