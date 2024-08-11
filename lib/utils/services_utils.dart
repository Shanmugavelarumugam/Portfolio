import 'package:folio/utils/utils.dart';

class ServicesUtils {
  static const List<String> servicesIcons = [
    StaticUtils.flutter,
    StaticUtils.dart,
    StaticUtils.figma,
    StaticUtils.firebase,
    StaticUtils.andriodStudio,
    StaticUtils.vscode, // Assuming you have icons for these
    StaticUtils.git,
    StaticUtils.github,
  ];

  static const List<String> servicesTitles = [
    "Flutter",
    "Dart",
    "Figma",
    "Firebase",
    "Android Studio",
    "VSCode",
    "Git",
    "GitHub",
  ];

  static const List<String> servicesDescription = [
    "Cross-platform app development using Flutter\n- Beautiful UIs\n- Fast development\n- High performance\n- Hot reload\n- Comprehensive widget library",
    "Programming with Dart\n- Modern syntax\n- Strong typing\n- Asynchronous programming\n- Great for Flutter development\n- Strong tooling support",
    "UI/UX design with Figma\n- Interactive prototypes\n- Collaborative design\n- Vector graphics editor\n- User interface design\n- Cloud-based design tool",
    "Backend as a Service with Firebase\n- Real-time database\n- Authentication\n- Cloud storage\n- Hosting\n- Analytics",
    "Android app development with Android Studio\n- Comprehensive IDE\n- Code editor\n- Emulator\n- Code templates\n- Performance profiling",
    "Code editing with VSCode\n- Lightweight and fast\n- Extensions marketplace\n- Integrated terminal\n- Debugging support\n- Git integration",
    "Version control with Git\n- Distributed version control system\n- Track changes\n- Branching and merging\n- Collaboration support\n- Efficient workflows",
    "Source code management with GitHub\n- Repository hosting\n- Collaboration tools\n- Issue tracking\n- Pull requests\n- Continuous integration",
  ];
}
