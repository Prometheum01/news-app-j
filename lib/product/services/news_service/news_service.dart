import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_for_job/product/model/news_model.dart';
import 'package:news_app_for_job/product/services/news_service/constants.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<NewsModel>?> fetchQuery(String query, {int page = 1}) async {
    final response = await dio.get(
      NewsServiceConstants.baseUrl,
      queryParameters: {
        NewsServiceConstants.paramQuery: query,
        NewsServiceConstants.paramPageSize: 25,
        NewsServiceConstants.paramPage: page,
        NewsServiceConstants.apiKey: NewsServiceConstants.apiKey
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.data != null) {
        final json = response.data[NewsServiceConstants.jsonArticles];

        List<NewsModel> list = [];

        for (var j in json) {
          list.add(NewsModel.fromJson(j));
        }

        return list;
      }
    }
    return null;
  }
}
