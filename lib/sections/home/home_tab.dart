import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:folio/animations/entrance_fader.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/social_links.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 1.02,
      decoration: BoxDecoration(
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
          // Background layer for animated clouds (Optional)
          Positioned.fill(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Opacity(
                    opacity: 0.9,
                    child: EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 1),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        StaticUtils.blackWhitePhoto,
                        height: size.width < 1200
                            ? size.height * 0.75
                            : size.height * 0.85,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main content layer
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                AppDimensions.normalize(30),
                AppDimensions.normalize(50),
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
                        style: AppText.b2!.copyWith(
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
                    "Shanmugavel", // Your name using the same font style
                    style: AppText.h1!.copyWith(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w100,
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
                              ' UI/UX Enthusiast',
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
                          pause: const Duration(seconds: 2),
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
        ],
      ),
    );
  }
}
