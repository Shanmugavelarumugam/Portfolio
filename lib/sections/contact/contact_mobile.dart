import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'package:folio/configs/app_dimensions.dart';
import 'package:folio/utils/contact_utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';

class ContactMobileTab extends StatelessWidget {
  const ContactMobileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.normalize(8)),
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
            text: "\nGet in Touch",
          ),
          const CustomSectionSubHeading(
            text: "Let's build something together :)\n\n",
          ),
          CarouselSlider.builder(
            itemCount: ContactUtils.contactIcon.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                GestureDetector(
              onTap: () => _launchURL(i),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ProjectCard(
                  projectIconData: ContactUtils.contactIcon[i],
                  projectTitle: ContactUtils.titles[i],
                  projectDescription: ContactUtils.details[i],
                ),
              ),
            ),
            options: CarouselOptions(
              height: AppDimensions.normalize(90),
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(int index) async {
    late final Uri url;
    switch (index) {
      case 0:
        // Location
        url = Uri.parse(
            'https://www.google.com/maps/search/?api=1&query=Chennai,+Tamil+Nadu');
        break;
      case 1:
        // Phone
        url = Uri.parse('https://wa.me/6381812437'); // WhatsApp link
        break;
      case 2:
        // Email
        url = Uri.parse('mailto:ashanmugavel821@gmail.com');
        break;
      default:
        return;
    }
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ProjectCard extends StatelessWidget {
  final IconData projectIconData;
  final String projectTitle;
  final String projectDescription;

  const ProjectCard({
    required this.projectIconData,
    required this.projectTitle,
    required this.projectDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(AppDimensions.normalize(8)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              projectIconData,
              size: AppDimensions.normalize(14),
              color: Colors.purple.shade400,
            ),
            title: Text(
              projectTitle,
              style: TextStyle(
                fontSize: AppDimensions.normalize(5),
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            subtitle: Text(
              projectDescription,
              style: TextStyle(
                fontSize: AppDimensions.normalize(4),
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
