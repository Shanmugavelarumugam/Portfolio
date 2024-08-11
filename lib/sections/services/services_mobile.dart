part of 'services.dart';

class ServiceMobile extends StatelessWidget {
  const ServiceMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: Space.hf(4),
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
            text: '\nSkills',
          ),
          const CustomSectionSubHeading(
            text: 'Explore my skills and the areas where I contribute.\n\n',
          ),
          Space.y!,
          CarouselSlider.builder(
            itemCount: ServicesUtils.servicesTitles.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: _ServiceCard(
                serviceIcon: ServicesUtils.servicesIcons[i],
                serviceTitle: ServicesUtils.servicesTitles[i],
                serviceDescription: ServicesUtils.servicesDescription[i],
              ),
            ),
            options: CarouselOptions(
              viewportFraction: 0.65,
              height: width < 450 ? height * 0.4 : height * 0.4,
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
}
