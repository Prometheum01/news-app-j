import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_for_job/core/constants/padding_const.dart';
import 'package:news_app_for_job/core/extensions/string_extension.dart';
import 'package:news_app_for_job/features/new_detail_page/view_model/new_detail_page_view_model.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';
import 'package:news_app_for_job/product/model/news_model.dart';

class NewDetailPageView extends StatefulWidget {
  const NewDetailPageView({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  State<NewDetailPageView> createState() => _NewDetailPageViewState();
}

class _NewDetailPageViewState extends NewDetailPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              //Share
              await shareUrl();
            },
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {
              addFavorite();
            },
            splashRadius: 24,
            icon: checkFavorite(),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () async {
              await openSource();
            },
            child: const Text(StringConst.newsSource)),
      ),
      body: Padding(
        padding: const PaddingConst.mediumAll(),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.network(
              widget.newsModel.image,
              height: context.dynamicHeight(0.4),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const PaddingConst.mediumAll(),
              child: Text(
                widget.newsModel.title,
                textAlign: TextAlign.center,
                style: context.textTheme.headline5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                    ),
                    Padding(
                      padding: const PaddingConst.mediumAll(),
                      child: Text(widget.newsModel.author),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                    ),
                    Padding(
                      padding: const PaddingConst.mediumAll(),
                      child: Text(
                        '${widget.newsModel.publishedDate.getDate()}\n${widget.newsModel.publishedDate.getTime()}',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Text(widget.newsModel.content),
          ]),
        ),
      ),
    );
  }
}
