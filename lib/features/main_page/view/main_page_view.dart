import 'package:flutter/material.dart';
import 'package:news_app_for_job/features/favorite_page/view/favorite_page_view.dart';
import 'package:news_app_for_job/features/home_page/view/home_page_view.dart';
import 'package:news_app_for_job/features/main_page/view_model/main_page_view_model.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends MainPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          changePage(value);
        },
        physics: const BouncingScrollPhysics(),
        children: const [HomePageView(), FavoritePageView()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changePage(value);
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: StringConst.homeLabelText),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: StringConst.favoriteLabelText),
        ],
      ),
    );
  }
}
