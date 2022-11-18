abstract class HtmlUtilsInterface {
  void redirect(String url);
  String getUrl();
  String getUserAgent();
  void triggerDownload(String url, String name);
  String getDeviceLocale();
  bool isPWA();
}
