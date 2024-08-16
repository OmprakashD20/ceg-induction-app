class MediaStrings {
  static const String cegPic = "assets/img/ceg.jpg";
  static const String cegFullPic = "assets/img/ceg_full.jpg";
  static const String splineBackground = "assets/img/Spline.png";
  static const String blueBG = "assets/img/bg.jpg";
  static const String blueBG2 = "assets/img/bg2.jpg";
  static const String blueBGFull = "assets/img/bgfull.jpg";
  static const String ctf = "assets/img/ctf.png";
  static const String user = "assets/img/user.png";
  static const String screen = "assets/img/screen.jpg";
  static const String map = 'assets/img/map.png';
  static const String loader = 'assets/img/loader.png';

  static const String scheduleBox = "assets/img/schedule.png";
  static const String cegMapBox = "assets/img/ceg_maps.png";
  static const String cegPlacesBox = "assets/img/ceg_places.png";
  static const String profileBox = "assets/img/profile.png";
  static const String eventsBox = "assets/img/events.png";
  static const String faqBox = "assets/img/faq.png";
  static const String helpBox = "assets/img/help.png";

  static const String bell = "assets/img/bell.png";
  static const String info = "assets/img/info.png";
  static const String dev = "assets/img/dev.png";

  static const String emptyBox = 'assets/lottie/emptybox.json';
  static const String male = 'assets/lottie/male.json';
  static const String female = 'assets/lottie/female.json';
  static const String errorConnection = 'assets/lottie/connection_error.json';
  static const String error404 = 'assets/lottie/404.json';
  static const String internet = 'assets/lottie/internet.json';
  static const String freshers = 'assets/lottie/freshers.json';

  static const Map<String, String> noInternetLoader = {
    "title": "Oops, No Internet!",
    "subTitle": 'Looks like you\'re offline. Let\'s reconnect and try again!',
    "lottie": internet
  };
  static const Map<String, String> loadingLoader = {
    "title": 'Hang Tight!',
    "subTitle": 'We\’re getting things ready for you...',
    "lottie": freshers
  };
  static const Map<String, String> connectionErrorLoader = {
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
}
