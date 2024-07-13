import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:image/image.dart' as i;
import 'package:tflite_flutter/tflite_flutter.dart';

enum DetectionClasses { healthy, sick }

extension DetectionClassesExtension on DetectionClasses {
  bool toBoolean() {
    return this == DetectionClasses.sick;
  }
}

Future<Map<String, dynamic>> convert(String imageUrl) async {
  try {
    final path = Uri.parse(imageUrl);
    final res = await http.get(path);
    if (res.statusCode > 399) throw Exception(res.body);
    final image = i.decodeImage(res.bodyBytes);
    if (image == null) throw Exception("Failed to decode image");

    i.Image resized = i.copyResize(image, width: 240, height: 240);
    Float32List bytes = Float32List(1 * 240 * 240 * 3);

    int pxIdx = 0;
    for (int y = 0; y < resized.height; y++) {
      for (int x = 0; x < resized.width; x++) {
        i.Pixel px = resized.getPixel(x, y);
        bytes[pxIdx++] = px.getChannel(i.Channel.red) / 127.5 - 1.0;
        bytes[pxIdx++] = px.getChannel(i.Channel.green) / 127.5 - 1.0;
        bytes[pxIdx++] = px.getChannel(i.Channel.blue) / 127.5 - 1.0;
      }
    }

    final input = bytes.reshape([1, 240, 240, 3]);
    final output = Float32List(1 * 1).reshape([1, 1]);
    return {"input": input, "output": output};
  } catch (e) {
    print(e);
  }
  return {"input": null, "output": null};
}
