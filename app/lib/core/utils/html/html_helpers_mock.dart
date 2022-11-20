import 'package:houston_app/core/utils/html/html_helpers_interface.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/singletons.dart';

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
    singleton<Log>().warn("trigger download not implemented for native");
  }

  @override
  String getDeviceLocale() {
    return "en";
  }
}
