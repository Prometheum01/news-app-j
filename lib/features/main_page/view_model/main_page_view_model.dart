import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../view/main_page_view.dart';

abstract class MainPageViewModel extends State<MainPageView> {
  late final PageController pageController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  changePage(int newIndex) {
    setState(() {
      currentIndex = newIndex;
      pageController.animateToPage(newIndex,
          duration: context.durationNormal, curve: Curves.ease);
    });
  }
}
