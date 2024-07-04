abstract class Scan {
  String get id;
  String get userId;
  String get url;

  set id(String id);
  set userId(String userId);
  set url(String url);
}

abstract class Result {
  String get id;
  String get scanId;
  String get scanUrl;

  set id(String id);
  set scanId(String scanId);
  set scanUrl(String scanUrl);
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

class ResultImpl implements Result {
  @override
  final String id;

  @override
  final String scanId;

  @override
  final String scanUrl;

  ResultImpl({required this.id, required this.scanId, required this.scanUrl});

  @override
  set id(String id) {
    id = id;
  }

  @override
  set scanId(String scanId) {
    scanId = scanId;
  }

  @override
  set scanUrl(String scanUrl) {
    scanUrl = scanUrl;
  }

  factory ResultImpl.fromJson(Map<String, dynamic> json) {
    return ResultImpl(
      id: json['id'],
      scanId: json['scanId'],
      scanUrl: json['scanUrl'],
    );
  }
}
