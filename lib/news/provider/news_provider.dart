import 'package:flutter/material.dart';
import 'package:news_app/news/model/news_model.dart';
import 'package:news_app/utils/api_helper.dart';

class NewsProvider with ChangeNotifier
{
  NewsModel? newsModel;
  Future<void> getNews()
  async {
    APIHelper apiHelper=APIHelper();
    NewsModel? n1 =await apiHelper.newsAPIToModel();
    newsModel=n1;
    notifyListeners();
  }
}
