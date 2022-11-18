import 'dart:typed_data';

import 'package:houston_app/core/utils/env.dart';
import 'package:http/http.dart' as http;

const MIN_RESIZE_SIZE = 16;

class ImageUrlBuilder {
  static String resize(String url, {required double width, double? height}) {
    if (url.contains(Env.mediaBaseUrl)) {
      int w = width.round();
      int h = height != null ? height.round() : w;

      if (w < MIN_RESIZE_SIZE) {
        w = MIN_RESIZE_SIZE;
      }

      if (h < MIN_RESIZE_SIZE) {
        h = MIN_RESIZE_SIZE;
      }

      return "$url?width=$w&height=$h&fill=cover";
    }
    return url;
  }
}

Future<Uint8List> imageUrlToBytes(String url) async {
  final response = await http.get(Uri.parse(url));

  return response.bodyBytes;
}
