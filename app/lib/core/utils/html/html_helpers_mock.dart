import 'package:houston_app/core/utils/html/html_helpers_interface.dart';

class HtmlUtilsImplementation extends HtmlUtilsInterface {
  @override
  void redirect(String url) {
    return;
  }

  @override
  String getUrl() {
    return "";
  }

  @override
  String getUserAgent() {
    return "dart";
  }

  @override
  bool isPWA() {
    return false;
  }

  @override
  void triggerDownload(String url, String name) {
    print(url);
  }

  @override
  String getDeviceLocale() {
    return "en";
  }
}
