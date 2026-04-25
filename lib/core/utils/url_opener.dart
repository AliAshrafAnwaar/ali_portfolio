import 'package:url_launcher/url_launcher.dart';

class UrlOpener {
  UrlOpener._();

  static Future<void> open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> email(String address, {String? subject}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: address,
      queryParameters: subject != null ? {'subject': subject} : null,
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
