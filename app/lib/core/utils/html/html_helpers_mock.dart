import 'html_helpers_interface.dart';
import '../logging.dart';
import '../singletons.dart';

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
