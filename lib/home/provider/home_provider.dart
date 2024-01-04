import 'package:flutter/material.dart';
import 'package:news_app/home/model/home_model.dart';
import 'package:news_app/utils/api_helper.dart';

class HomeProvider with ChangeNotifier
{
  HomeModel? homeModel;
  Future<void> getData()
  async {
    APIHelper apiHelper = APIHelper();
    HomeModel? m1 = await apiHelper.apiToModel();
    homeModel=m1;
    notifyListeners();
  }
}