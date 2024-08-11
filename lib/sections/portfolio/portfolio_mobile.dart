import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/constants.dart';
import 'package:folio/utils/project_utils.dart';
import 'package:folio/utils/utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: Space.h!,
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
            text: "\nPortfolio",
          ),
          const CustomSectionSubHeading(
            text: "Here are few samples of my previous work :)\n\n",
          ),
          CarouselSlider.builder(
            itemCount: ProjectUtils.titles.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: ProjectCard(
                banner:
                    ProjectUtils.banners[i], // Adding banner for consistency
                projectIcon: ProjectUtils.icons[i],
                projectLink: ProjectUtils.links[i],
                projectTitle: ProjectUtils.titles[i],
                projectDescription: ProjectUtils.description[i],
              ),
            ),
            options: CarouselOptions(
              height: height * 0.4,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
          Space.y!,
          SizedBox(
            height: AppDimensions.normalize(14),
            width: AppDimensions.normalize(50),
            child: OutlinedButton(
              onPressed: () => openURL(StaticUtils.gitHub),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.amber,
                side: BorderSide(
                  color: Colors.amber, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: Text(
                'See More',
                style: AppText.l1b?.copyWith(
                  color: Colors.amber, // Text color
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
