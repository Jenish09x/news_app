import 'package:flutter/material.dart';
import 'package:news_app/dash/provider/dash_provider.dart';
import 'package:news_app/home/provider/home_provider.dart';
import 'package:news_app/news/provider/news_provider.dart';
import 'package:news_app/news/view/news_screen.dart';
import 'package:news_app/utils/screen_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: screen_routes,
      ),
    ),
  );
}
