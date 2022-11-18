import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:houston_app/core/app.dart';

enum ScreenSize {
  sm,
  md,
  lg,
}

class ScreenUtils {
  static const breakpointSm = 576.0;
  static const breakpointMd = 992.0;

  static const bool isWeb = kIsWeb;

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide;
  }

  static ScreenSize size(BuildContext context) {
    if (width(context) < breakpointSm) {
      return ScreenSize.sm;
    }

    if (width(context) < breakpointMd) {
      return ScreenSize.md;
    }

    return ScreenSize.lg;
  }
}
