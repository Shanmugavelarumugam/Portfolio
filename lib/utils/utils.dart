import 'package:flutter/material.dart';
import 'package:folio/sections/about/about.dart';
import 'package:folio/sections/contact/contact.dart';
import 'package:folio/sections/home/home.dart';
import 'package:folio/sections/portfolio/portfolio.dart';
import 'package:folio/sections/services/services.dart';
import 'package:folio/widget/footer.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/st.png';
  static const String university = 'assets/work/rec.png';
  static const String fullterIsb = 'assets/work/mdquality.png';

  // services
  static const String dart = 'assets/services/nice.png';
  static const String firebase = 'assets/services/firebase.png';
  static const String flutter = 'assets/services/race.png';
  static const String figma = 'assets/services/figma.png';
  static const String andriodStudio = 'assets/services/good.png';
  static const String andriodStudioBlack = 'assets/services/good.png';
  static const String vscode = 'assets/services/vscode.png';
  static const String git = 'assets/services/git.png';
  static const String github = 'assets/services/github.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png"
  ];

  static const List<String> socialLinks = [
    "https://www.facebook.com/shanmugavel.a.5283?mibextid=ZbWKwL",
    "https://www.instagram.com/hari_vishal_59?igsh=MXZ0dmljb3djZGN2dg==",
    "https://www.linkedin.com/in/shanmugavel45?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
    "https://github.com/Shanmugavelarumugam"
  ];

  static const String resume =
      'https://drive.google.com/file/d/154Y1O8sLeCJPeHFBYENRG6xpGEa8mBxm/view?usp=drivesdk';

  static const String gitHub = 'https://github.com/Shanmugavelarumugam';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
