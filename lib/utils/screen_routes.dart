import 'package:flutter/cupertino.dart';
import 'package:news_app/news/view/news_screen.dart';

import '../home/view/home_screen.dart';

Map<String,WidgetBuilder>screen_routes={
  '/':(context) => const HomeScreen(),
  'news':(context) => const NewsScreen(),
};