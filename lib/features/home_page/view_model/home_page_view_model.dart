import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_for_job/core/mixins/loading_mixin.dart';
import 'package:news_app_for_job/product/model/news_model.dart';
import 'package:news_app_for_job/product/services/news_service/news_service.dart';
import 'package:news_app_for_job/product/services/provider_service/news_provider.dart';
import 'package:provider/provider.dart';

import '../view/home_page_view.dart';

abstract class HomePageViewModel extends State<HomePageView> with LoadingMixin {
  late final TextEditingController searchFieldController;

  // ignore: prefer_typing_uninitialized_variables
  late final searchFormKey = GlobalKey<FormState>();

  late final ScrollController scrollController;

  late List<NewsModel> newsList = [];

  final NewsService newsService = NewsService(Dio());

  String searchedWord = '';

  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    if (context.read<NewsProvider>().lastSearchedNews.isNotEmpty) {
      newsList = context.read<NewsProvider>().lastSearchedNews;
    }
    searchFieldController = TextEditingController();
    scrollController = ScrollController();

    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          pageIndex += 1;
          fetchNewItems();
        }
      },
    );
  }

  fetchNewItems() async {
    newsList += await newsService.fetchQuery(
            searchFieldController.text.trim().toString(),
            page: pageIndex) ??
        [];

    // ignore: use_build_context_synchronously
    context.read<NewsProvider>().setNewSearchedNews(newsList);
    setState(() {});
  }

  searchNews() async {
    if (searchFormKey.currentState!.validate()) {
      //Fetch News
      changeLoading();

      newsList = await newsService
              .fetchQuery(searchFieldController.text.trim().toString()) ??
          [];

      searchedWord = searchFieldController.text.trim().toString();

      // ignore: use_build_context_synchronously
      context.read<NewsProvider>().setNewSearchedNews(newsList);
      changeLoading();
    }
  }
}
