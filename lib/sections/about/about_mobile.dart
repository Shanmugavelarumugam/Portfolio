import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/community_button.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

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
      child: Column(
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          SizedBox(height: height * 0.03),
          Image.asset(
            StaticUtils.mobilePhoto,
            height: height * 0.27,
          ),
          SizedBox(height: height * 0.03),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Who am I?",
              style: AppText.b2!.copyWith(
                color: AppTheme.c!.primary,
                fontSize: AppDimensions.normalize(8),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.normalize(7),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: height * 0.02),
          Text(
            AboutUtils.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.normalize(6),
            ),
            textAlign: TextAlign.left,
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                text: 'Flutter Frontend Developer Internship at InternCareer',
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Divider(
            color: Colors.grey[800],
            thickness: AppDimensions.normalize(0.5),
          ),
          SizedBox(height: height * 0.03),
          SizedBox(
            height: AppDimensions.normalize(13),
            width: AppDimensions.normalize(40),
            child: OutlinedButton(
              onPressed: () => html.window.open(StaticUtils.resume, 'pdf'),
              child: const Text("Resume"),
            ),
          ),
          SizedBox(height: height * 0.03),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: WorkUtils.logos
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CommunityIconBtn(
                      icon: e.value,
                      link: WorkUtils.communityLinks[e.key],
                      height: WorkUtils.communityLogoHeight[e.key],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: AppDimensions.normalize(6), // Adjust icon size here
            color: AppTheme.c!.primary,
          ),
          SizedBox(
              width: AppDimensions.normalize(
                  2)), // Adjust spacing between icon and text
          Expanded(
            child: Text(
              text,
              style: AppText.b2!.copyWith(
                height: 1.5,
                letterSpacing: 1.1,
                fontFamily: 'Montserrat',
                fontSize: AppDimensions.normalize(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
