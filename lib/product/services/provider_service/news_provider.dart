import 'package:flutter/material.dart';
import 'package:news_app_for_job/product/model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<NewsModel> _favoritesNews = [];
  // ignore: prefer_final_fields
  List<NewsModel> _lastSearchedNews = [];

  setNewSearchedNews(List<NewsModel> news) {
    _lastSearchedNews = news;
    notifyListeners();
  }

  addFavoriteNews(NewsModel favoriteNew) {
    if (_favoritesNews.contains(favoriteNew)) {
      _favoritesNews.remove(favoriteNew);
    } else {
      _favoritesNews.add(favoriteNew);
    }
    notifyListeners();
  }

  List<NewsModel> get favoriteNews => _favoritesNews;
  List<NewsModel> get lastSearchedNews => _lastSearchedNews;
}
