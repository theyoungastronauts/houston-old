// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:houston_app/core/utils/html/html_helpers_interface.dart';
import 'dart:ui' as ui;

class HtmlUtilsImplementation extends HtmlUtilsInterface {
  @override
  void redirect(String url) {
    html.window.open(url, "_self");
  }

  @override
  String getUrl() {
    return html.window.location.href;
  }

  @override
  String getUserAgent() {
    return html.window.navigator.userAgent;
  }

  @override
  void triggerDownload(String url, String name) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = name;
    anchorElement.click();
  }

  @override
  bool isPWA() {
    return html.window.matchMedia('(display-mode: standalone)').matches;
  }

  @override
  String getDeviceLocale() {
    final locale = ui.window.locale;
    return locale.languageCode;
  }
}
