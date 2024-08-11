import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher
import 'package:folio/animations/bottom_animation.dart';
import 'package:folio/configs/configs.dart';
import 'package:folio/utils/contact_utils.dart';
import 'package:folio/widget/custom_text_heading.dart';
import 'package:folio/widget/project_card.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1, 1),
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
          Space.y!,
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: AppDimensions.normalize(10),
            children: ContactUtils.contactIcon.asMap().entries.map((e) {
              return SizedBox(
                width: AppDimensions.normalize(150),
                child: WidgetAnimator(
                  child: GestureDetector(
                    onTap: () {
                      _launchURL(e.key);
                    },
                    child: ProjectCard(
                      projectIconData: e.value,
                      projectTitle: ContactUtils.titles[e.key],
                      projectDescription: ContactUtils.details[e.key],
                    ),
                  ),
                ),
              );
            }).toList(),
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
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(projectIconData),
            title: Text(projectTitle),
            subtitle: Text(projectDescription),
          ),
        ],
      ),
    );
  }
}
