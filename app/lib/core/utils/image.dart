import 'dart:typed_data';

import 'package:houston_app/core/utils/env.dart';
import 'package:houston_app/feature/asset/constants.dart';
import 'package:http/http.dart' as http;

class ImageUrlBuilder {
  static String resize(String url, {required double width, double? height}) {
    if (url.contains(Env.mediaBaseUrl)) {
      int w = width.round();
      int h = height != null ? height.round() : w;

      if (w < MIN_IMAGE_RESIZE_SIZE) {
        w = MIN_IMAGE_RESIZE_SIZE;
      }

      if (h < MIN_IMAGE_RESIZE_SIZE) {
        h = MIN_IMAGE_RESIZE_SIZE;
      }

      return "$url?width=$w&height=$h&fill=cover";
    }
    return url;
  }

  static String stripTransforms(String url) {
    if (url.contains("?")) {
      return url.split("?").first;
    }
    return url;
  }
}

Future<Uint8List> imageUrlToBytes(String url) async {
  final response = await http.get(Uri.parse(url));

  return response.bodyBytes;
}
