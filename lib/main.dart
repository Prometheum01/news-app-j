import 'package:flutter/material.dart';
import 'package:news_app_for_job/features/main_page/view/main_page_view.dart';
import 'package:news_app_for_job/product/services/provider_service/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App For Job :)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPageView(),
    );
  }
}
