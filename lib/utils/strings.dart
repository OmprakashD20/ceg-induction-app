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

  static const String bell = "assets/img/bell.png";
  static const String info = "assets/img/info.png";
  static const String dev = "assets/img/dev.png";

  static const String emptyBox = 'assets/lottie/emptybox.json';
  static const String male = 'assets/lottie/male.json';
  static const String female = 'assets/lottie/female.json';

  static const String internet = 'assets/lottie/internet.json';
  static const String noInternetTitle = 'Oops, No Internet!';
  static const String noInternetSubTitle =
      'Looks like you\'re offline. Let\'s reconnect and try again!';

  static const String freshers = 'assets/lottie/freshers.json';
  static const String loadingTitle = 'Hang Tight!';
  static const String loadingSubTitle =
      'We\’re getting things ready for you...';

  static const Map<String, String> noInternet = {
    "title": noInternetTitle,
    "subTitle": noInternetSubTitle,
    "lottie": internet
  };
  static const Map<String, String> loading = {
    "title": loadingTitle,
    "subTitle": loadingSubTitle,
    "lottie": freshers
  };
}
