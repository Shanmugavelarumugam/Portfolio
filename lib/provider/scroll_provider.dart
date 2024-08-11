import 'package:flutter/cupertino.dart';
import 'package:folio/configs/app_dimensions.dart';

class ScrollProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();

  ScrollController get controller => scrollController;

  void scroll(int index) {
    double offset = index == 1
        ? 307
        : index == 2
            ? 307
            : index == 3
                ? 315
                : 350;
    scrollController.animateTo(
      AppDimensions.normalize(offset * index.toDouble()),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void scrollMobile(int index) {
    double offset = index == 1
        ? 290
        : index == 2
            ? 360
            : index == 3
                ? 300
                : 310;
    scrollController.animateTo(
      AppDimensions.normalize(offset * index.toDouble()),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
