import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app_for_job/core/constants/padding_const.dart';
import 'package:news_app_for_job/features/home_page/view_model/home_page_view_model.dart';
import 'package:news_app_for_job/product/constants/serach_field_input_decoration.dart';
import 'package:news_app_for_job/product/constants/string_const.dart';

import '../../../product/widgets/news_preview.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homPageAppBar(),
      body: Padding(
        padding: const PaddingConst.mediumAll(),
        child: Column(
          children: [
            Padding(
              padding: const PaddingConst.mediumBottom(),
              child: Form(
                key: searchFormKey,
                child: TextFormField(
                  controller: searchFieldController,
                  decoration: SearchFieldInputDecoration(onTap: () async {
                    await searchNews();
                  }),
                  validator: (value) {
                    if (!(value != null && value.trim().isNotEmpty)) {
                      return StringConst.searchFieldValidatorText;
                    }
                    return null;
                  },
                ),
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : newsList.isEmpty
                    ? const Center(
                        child: Text(StringConst.thereIsNoNewsText),
                      )
                    : Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: newsList.length + 1,
                          itemBuilder: (context, index) {
                            if (index < newsList.length) {
                              return NewsPreview(newsModel: newsList[index]);
                            } else {
                              return const Padding(
                                padding: PaddingConst.mediumAll(),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  AppBar _homPageAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        StringConst.newsApp,
        style: context.textTheme.headline3,
      ),
    );
  }
}
