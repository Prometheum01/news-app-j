import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_for_job/core/constants/padding_const.dart';
import 'package:news_app_for_job/features/favorite_page/view_model/favorite_page_view_model.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';
import 'package:news_app_for_job/product/model/news_model.dart';
import 'package:provider/provider.dart';

import '../../../product/services/provider_service/news_provider.dart';
import '../../../product/widgets/news_preview.dart';

class FavoritePageView extends StatefulWidget {
  const FavoritePageView({super.key});

  @override
  State<FavoritePageView> createState() => _FavoritePageViewState();
}

class _FavoritePageViewState extends FavoritePageViewModel {
  @override
  Widget build(BuildContext context) {
    List<NewsModel> favoritesList = context.watch<NewsProvider>().favoriteNews;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConst.favoritesText,
          style: context.textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const PaddingConst.mediumAll(),
        child: favoritesList.isEmpty
            ? const Center(child: Text(StringConst.thereIsNoFavoritesNewsText))
            : ListView.builder(
                itemCount: favoritesList.length,
                itemBuilder: (context, index) =>
                    NewsPreview(newsModel: favoritesList[index]),
              ),
      ),
    );
  }
}
