import 'package:url_launcher/url_launcher.dart' as impl;

abstract class IOpenURLProvider {
  Future<bool> open(
    String url,
  );
  Future<bool> canOpen(String url);
}

class OpenURLProvider implements IOpenURLProvider {
  @override
  Future<bool> open(
    String url,
  ) async {
    try {
      await impl.launchUrl(
        Uri.parse(url),
        mode: impl.LaunchMode.externalApplication,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> canOpen(String url) {
    return impl.canLaunchUrl(Uri.parse(url));
  }
}
