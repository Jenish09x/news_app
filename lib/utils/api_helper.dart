import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/home/model/home_model.dart';

import '../news/model/news_model.dart';

class APIHelper{

  Future<HomeModel?> apiToModel(String contry)async {

    String apiLink="https://newsapi.org/v2/top-headlines?country=$contry&category=business&apiKey=c3a54fe623fe49baa0d9a717a8acd9de";
    var api=Uri.parse(apiLink);
    var response = await http.get(api);
    if(response.statusCode==200)
      {
        var json=jsonDecode(response.body);
        HomeModel homeModel=HomeModel.mapToModel(json);
        return homeModel;
      }
    return null;
  }

  Future<NewsModel?> newsAPIToModel()
  async {
    String apiLink="https://newsapi.org/v2/everything?q=tesla&from=2023-12-05&sortBy=publishedAt&apiKey=c3a54fe623fe49baa0d9a717a8acd9de";
    var api=Uri.parse(apiLink);
    var response = await http.get(api);
    if(response.statusCode==200)
    {
      var json=jsonDecode(response.body);
      NewsModel newsModel=NewsModel.mapToModel(json);
      return newsModel;
    }
    return null;
  }
}