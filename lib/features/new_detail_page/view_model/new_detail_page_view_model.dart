import 'package:flutter/material.dart';
import 'package:news_app_for_job/product/services/provider_service/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../product/services/url_launcher_service/url_launcher_service.dart';
import '../view/new_detail_page_view.dart';

abstract class NewDetailPageViewModel extends State<NewDetailPageView> {
  @override
  void initState() {
    super.initState();
  }

  Icon checkFavorite() {
    if (context.watch<NewsProvider>().favoriteNews.contains(widget.newsModel)) {
      return const Icon(Icons.favorite);
    }
    return const Icon(Icons.favorite_border_outlined);
  }

  addFavorite() {
    context.read<NewsProvider>().addFavoriteNews(widget.newsModel);
  }

  openSource() async {
    await CustomUrlLauncher.customLaunchUrl(widget.newsModel.sourceUrl);
  }

  shareUrl() async {
    await Share.share('Hello! \n\n${widget.newsModel.sourceUrl}');
  }
}
