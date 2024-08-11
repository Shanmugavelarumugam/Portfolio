import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/social_links.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop>
    with TickerProviderStateMixin {
  late AnimationController _sunController;
  late AnimationController _cloudController;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _sunController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _cloudController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _sunController.dispose();
    _cloudController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.025,
      padding: Space.h,
      decoration: BoxDecoration(
        // Gradient Background
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade300,
            Colors.purple.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Background layer for animated clouds
          Positioned.fill(
            child: Stack(
              children: [
                // Cloud Animation 1
                Positioned(
                  top: size.height * 0.1,
                  left: size.width * 0.0,
                  child: AnimatedBuilder(
                    animation: _cloudController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(_cloudController.value * 400 - 200, 0),
                        child: CustomPaint(
                          size: Size(180, 100),
                          painter: CloudPainter(),
                        ),
                      );
                    },
                  ),
                ),
                // Cloud Animation 2
                Positioned(
                  top: size.height * 0.3,
                  left: size.width * 0.5,
                  child: AnimatedBuilder(
                    animation: _cloudController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(-_cloudController.value * 400 + 200, 0),
                        child: CustomPaint(
                          size: Size(180, 100),
                          painter: CloudPainter(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Main content layer
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppDimensions.normalize(40)),
                    child: Opacity(
                      opacity: 0.9,
                      child: EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 1),
                        duration: const Duration(milliseconds: 800),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: AppDimensions.normalize(20)),
                          child: Image.asset(
                            StaticUtils.blackWhitePhoto,
                            height: size.width < 1200
                                ? size.height * 0.85
                                : size.height * 0.9,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        AppDimensions.normalize(30),
                        AppDimensions.normalize(80),
                        0,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'WELCOME TO MY PORTFOLIO! ',
                                style: AppText.b1!.copyWith(
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              EntranceFader(
                                offset: const Offset(0, 0),
                                delay: const Duration(seconds: 2),
                                duration: const Duration(milliseconds: 800),
                                child: Image.asset(
                                  StaticUtils.hi,
                                  height: AppDimensions.normalize(12),
                                ),
                              ),
                            ],
                          ),
                          Space.y1!,
                          Text(
                            "Shanmugavel A",
                            style: AppText.h1b!.copyWith(
                              fontSize: AppDimensions.normalize(25),
                              height: 1,
                            ),
                          ),
                          EntranceFader(
                            offset: const Offset(-10, 0),
                            delay: const Duration(seconds: 1),
                            duration: const Duration(milliseconds: 800),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: AppTheme.c!.primary!,
                                ),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      ' Flutter Developer',
                                      speed: const Duration(milliseconds: 50),
                                      textStyle: AppText.b1,
                                    ),
                                    TyperAnimatedText(
                                      ' Mobile App Developer',
                                      speed: const Duration(milliseconds: 50),
                                      textStyle: AppText.b1,
                                    ),
                                    TyperAnimatedText(
                                      ' A friend :)',
                                      speed: const Duration(milliseconds: 50),
                                      textStyle: AppText.b1,
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                  repeatForever: true,
                                  pause: const Duration(
                                      seconds: 2), // Pause for 2 seconds between texts
                                ),
                              ],
                            ),
                          ),
                          Space.y2!,
                          const SocialLinks(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Sun Animation (on top of all layers)
          Positioned(
            top: size.height * 0.15, // Moved one step down
            right: size.width * 0.1,
            child: FadeTransition(
              opacity: _sunController,
              child: ScaleTransition(
                scale:
                    Tween<double>(begin: 1.0, end: 1.5).animate(_sunController),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.8),
                        blurRadius: 20,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.wb_sunny,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for cloud
class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..addOval(Rect.fromLTWH(20, 20, 80, 60))
      ..addOval(Rect.fromLTWH(60, 10, 100, 80))
      ..addOval(Rect.fromLTWH(100, 30, 80, 60))
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
