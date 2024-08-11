import 'package:carousel_slider/carousel_slider.dart';

import 'package:carousel_slider/carousel_controller.dart' as slider;
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final slider.CarouselController _controller = slider.CarouselController();

  final List<Widget> items;

  CustomCarousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(),
      carouselController: _controller,
    );
  }
}
