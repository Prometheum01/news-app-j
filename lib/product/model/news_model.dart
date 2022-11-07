import 'package:news_app_for_job/product/services/news_service/constants.dart';

class NewsModel {
  final String author;
  final String title;
  final String description;
  final String content;
  final String image;
  final String sourceUrl;
  final String publishedDate;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.content,
    required this.image,
    required this.sourceUrl,
    required this.publishedDate,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        author: json[NewsServiceConstants.jsonAuthor].toString(),
        title: json[NewsServiceConstants.jsonTitle].toString(),
        description: json[NewsServiceConstants.jsonDescription].toString(),
        content: json[NewsServiceConstants.jsonContent].toString(),
        image: json[NewsServiceConstants.jsonUrlToImages].toString(),
        sourceUrl: json[NewsServiceConstants.jsonUrl].toString(),
        publishedDate: json[NewsServiceConstants.jsonPublishedAt].toString());
  }
}
