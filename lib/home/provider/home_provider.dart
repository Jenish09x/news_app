import 'package:flutter/material.dart';
import 'package:news_app/home/model/home_model.dart';
import 'package:news_app/utils/api_helper.dart';

class HomeProvider with ChangeNotifier
{
  HomeModel? homeModel;
  String contry='us';
  Future<void> getData()
  async {
    APIHelper apiHelper = APIHelper();
    HomeModel? m1 = await apiHelper.apiToModel(contry);
    homeModel=m1;
    notifyListeners();
  }

  void CheckContry(String code)
  {
    contry=code;
    notifyListeners();
  }
}