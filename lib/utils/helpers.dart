import 'package:url_launcher/url_launcher.dart';

class IHelpers {
  static Future<void> launch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> phoneCall({required String phoneNo}) async {
    final Uri _url = Uri(scheme: "tel", path: phoneNo);
    launch(_url);
  }

  static Future<void> whatsappMessage({required String phoneNo}) async {
    final Uri _url = Uri.parse("https://wa.me/${phoneNo}?text=Hi");
    launch(_url);
  }

  static Future<void> socials({required String link}) async {
    final Uri _url = Uri.parse(link);
    launch(_url);
  }

  static Future<void> sendEmail(
      {required String email, String subject = "", String body = ""}) async {
    final Uri _url = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    launch(_url);
  }

  static Future<void> openMap(String mapUrl) async {
    final Uri _url = Uri.parse(mapUrl);
    launch(_url);
  }
}
