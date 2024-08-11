import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/about_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/utils/work_utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:universal_html/html.dart' as html;
import 'package:folio/constants.dart';
import 'package:folio/widget/about_me_data.dart';
import 'package:folio/widget/community_button.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(AppDimensions.normalize(16)),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSectionHeading(
            text: '\nAbout Me',
          ),
          const CustomSectionSubHeading(
            text: 'Get to know me :)',
          ),
          SizedBox(height: height * 0.02),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              StaticUtils.mobilePhoto,
              height: height * 0.27,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            "Who am I?",
            style: AppText.b2!.copyWith(
              color: Colors.white,
              fontSize: AppDimensions.normalize(6),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Text(
            AboutUtils.aboutMeHeadline,
            style: AppText.b2b!.copyWith(
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.normalize(5),
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Text(
            AboutUtils.aboutMeDetail,
            style: AppText.l1!.copyWith(
              height: 2,
              letterSpacing: 1.1,
              fontFamily: 'Montserrat',
              fontSize: AppDimensions.normalize(4.5),
              color: Colors.white,
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
              color: Colors.white,
              fontSize: AppDimensions.normalize(6),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AboutMeData(
                    data: "Name",
                    information: "Muhammad Hamza",
                  ),
                  AboutMeData(
                    data: "Age",
                    information: "24",
                  ),
                ],
              ),
              SizedBox(
                width: width > 710 ? width * 0.2 : width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  AboutMeData(
                    data: "Email",
                    information: "hamza.6.shakeel@gmail.com",
                  ),
                  AboutMeData(
                    data: "From",
                    information: "Attock, PK",
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.normalize(13),
                width: AppDimensions.normalize(40),
                child: OutlinedButton(
                  onPressed: () => html.window.open(StaticUtils.resume, 'pdf'),
                  child: const Text("Resume"),
                ),
              ),
              SizedBox(width: AppDimensions.normalize(10)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: AppDimensions.normalize(6),
            color: Colors.white,
          ),
          SizedBox(width: AppDimensions.normalize(6)),
          Expanded(
            child: Text(
              text,
              style: AppText.b2!.copyWith(
                height: 1.5,
                letterSpacing: 1.1,
                fontFamily: 'Montserrat',
                fontSize: AppDimensions.normalize(5),
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
