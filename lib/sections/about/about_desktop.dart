import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSectionHeading(
                text: '\nAbout Me',
              ),
              const CustomSectionSubHeading(
                text: 'Get to know me :)',
              ),
              SizedBox(height: height * 0.05),
              Text(
                'Who am I?',
                style: AppText.b1!.copyWith(
                  color: AppTheme.c!.primary,
                  fontSize: AppDimensions.normalize(8),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Text(
                AboutUtils.aboutMeHeadline,
                style: AppText.b1b!.copyWith(
                  fontFamily: 'Montserrat',
                  fontSize: AppDimensions.normalize(7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Text(
                AboutUtils.aboutMeDetail,
                style: AppText.b2!.copyWith(
                  height: 2,
                  letterSpacing: 1.1,
                  fontFamily: 'Montserrat',
                  fontSize: AppDimensions.normalize(6),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.03),
              Divider(
                color: Colors.grey[800],
                thickness: AppDimensions.normalize(0.5),
              ),
              SizedBox(height: height * 0.03),
              Text(
                'Experience',
                style: AppText.l1!.copyWith(
                  color: AppTheme.c!.primary,
                  fontSize: AppDimensions.normalize(7),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildExperienceItem(
                    icon: Icons.star,
                    text:
                        'Flutter Developer Internship at MDQuality Apps Solutions',
                  ),
                  _buildExperienceItem(
                    icon: Icons.star,
                    text: 'Mobile App Developer Internship at Introvertish',
                  ),
                  _buildExperienceItem(
                    icon: Icons.star,
                    text:
                        'Flutter Frontend Developer Internship at InternCareer',
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Divider(
                color: Colors.grey[800],
                thickness: AppDimensions.normalize(0.5),
              ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppDimensions.normalize(13),
                    width: AppDimensions.normalize(40),
                    child: OutlinedButton(
                      onPressed: () =>
                          html.window.open(StaticUtils.resume, 'pdf'),
                      child: const Text("Resume"),
                    ),
                  ),
                  SizedBox(width: AppDimensions.normalize(20)),
                  Container(
                    color: Colors.grey[900]!,
                    width: AppDimensions.normalize(30),
                    height: AppDimensions.normalize(0.5),
                  ),
                  SizedBox(width: AppDimensions.normalize(20)),
                  ...WorkUtils.logos.asMap().entries.map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CommunityIconBtn(
                            icon: e.value,
                            link: WorkUtils.communityLinks[e.key],
                            height: WorkUtils.communityLogoHeight[e.key],
                          ),
                        ),
                      )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppDimensions.normalize(8),
            color: AppTheme.c!.primary,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: AppText.b2!.copyWith(
              height: 1.5,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.normalize(6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}