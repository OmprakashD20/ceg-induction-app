import 'package:induction_app/common/widgets/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class IHelpers {
  static Future<void> launch(
    Uri url,
    String name,
  ) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ISnackBar.customToast(
          type: SnackBarType.error,
          title: "Oops! $name Redirect Failed.",
          subTitle:
              "We couldn't make a redirect to your ${name.toLowerCase()} right now");

      throw 'Could not launch $url';
    }
  }

  static Future<void> phoneCall({required String phoneNo}) async {
    final Uri url = Uri(scheme: "tel", path: phoneNo);
    launch(url, "Phone Call");
  }

  static Future<void> whatsappMessage({required String phoneNo}) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNo?text=Hi");
    launch(url, "Whatsapp");
  }

  static Future<void> socials({required String link}) async {
    final Uri url = Uri.parse(link);
    launch(url, "Socials");
  }

  static Future<void> sendEmail(
      {required String email, String subject = "", String body = ""}) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    launch(url, "GMail");
  }

  static Future<void> openMap(String mapUrl) async {
    final Uri url = Uri.parse(mapUrl);
    launch(url, "Google Maps");
  }
}
