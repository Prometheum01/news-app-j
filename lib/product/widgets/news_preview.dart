import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_for_job/features/new_detail_page/view/new_detail_page_view.dart';

import '../model/news_model.dart';

class NewsPreview extends StatelessWidget {
  const NewsPreview({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewDetailPageView(newsModel: newsModel),
          ));
        },
        title: Text(
          newsModel.title,
          style: context.textTheme.headline5,
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.description,
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: SizedBox(
          height: context.dynamicHeight(0.15),
          width: context.dynamicWidth(0.25),
          child: Image.network(
            newsModel.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
