import 'package:iconsax/iconsax.dart';
import 'package:induction_app/utils/color.dart';

class Constants {
  static const String techopsEmail = "techops@cegtechforum.in";
  static const String hrEmail = "hr@cegtechforum.in";

  static const String cegPic = "assets/img/ceg.webp";
  static const String cegFullPic = "assets/img/ceg_full.webp";
  static const String blueBG = "assets/img/bg.webp";
  static const String blueBG2 = "assets/img/bg2.webp";
  static const String blueBGFull = "assets/img/bgfull.webp";
  static const String ctf = "assets/img/ctf.webp";
  static const String user = "assets/img/user.webp";
  static const String screen = "assets/img/screen.webp";
  static const String map = 'assets/img/map.webp';
  static const String loader = 'assets/img/loader.webp';
  static const String placeholder = 'assets/img/placeholder.jpg';

  static const String scheduleBox = "assets/img/schedule.webp";
  static const String cegMapBox = "assets/img/ceg_maps.webp";
  static const String cegPlacesBox = "assets/img/ceg_places.webp";
  static const String profileBox = "assets/img/profile.webp";
  static const String eventsBox = "assets/img/events.webp";
  static const String faqBox = "assets/img/faq.webp";
  static const String helpBox = "assets/img/help.webp";

  static const String bell = "assets/img/bell.webp";
  static const String dev = "assets/img/dev.webp";

  static const String emptyBox = 'assets/lottie/emptybox.json';
  static const String male = 'assets/lottie/male.json';
  static const String female = 'assets/lottie/female.json';
  static const String errorConnection = 'assets/lottie/connection_error.json';
  static const String error404 = 'assets/lottie/404.json';
  static const String freshers = 'assets/lottie/freshers.json';
  static const String holiday = 'assets/lottie/holiday.json';
  static const String cat = 'assets/lottie/cat.json';
  static const String tabletNot = 'assets/lottie/tablet.json';

  static const Map<String, String> loadingLoader = {
    "title": 'Hang Tight!',
    "subTitle": 'We\'re getting things ready for you...',
    "lottie": freshers
  };
  static const Map<String, String> noInternetLoader = {
    "title": "Oops! You're Offline",
    "subTitle":
        "Looks like your connection dropped. Let's get you back online!",
    "lottie": errorConnection
  };
  static const Map<String, String> error404Loader = {
    "title": "Page Not Found",
    "subTitle": "Uh-oh! We can't seem to find what you're looking for.",
    "lottie": error404
  };
  static const Map<String, String> noTabletLoader = {
    "title": "Oops, Not Available on Tablet!",
    "subTitle":
        "This feature is best viewed on a mobile device. Please switch to your phone to continue.",
    "lottie": tabletNot
  };

  static Map<String, Map<String, dynamic>> notificationStyles = {
    'Today': {
      'color': IColors.success,
      'icon': Iconsax.message_2,
      'background': IColors.success.withOpacity(0.25),
    },
    'Yesterday': {
      'color': IColors.warning,
      'icon': Iconsax.message_tick,
      'background': IColors.warning.withOpacity(0.25),
    },
    'Default': {
      'color': IColors.error,
      'icon': Iconsax.message_time,
      'background': IColors.error.withOpacity(0.25),
    },
  };
}
