import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/m5_news/internet_news.dart';
import 'package:mydtm/data/internet_connections/m5_news/network_nws_body.dart';
import 'dart:developer';

import 'package:mydtm/data/model_parse/m5_model/model_news.dart';

class ProviderDtmNews extends ChangeNotifier {
  late ModelDtmNews modelDtmNews;
  List<ModelDtmNews> modelDtmNews2 = [];
  bool boolDtmNews = false;

  Future getAllDtmNews() async {
    try {
      boolDtmNews = false;
      String dataNews = await NetworkDtmNews.getCheckDownloads();
      modelDtmNews2 = (jsonDecode(dataNews) as List).map((e)=>ModelDtmNews.fromJson(e)).toList();
      boolDtmNews = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }


  late String data;
  bool boolDownLoadData = false;
  Future getBodyById({required String id})async{
 try   {
      boolDownLoadData = false;
      String data1 = await NetworkNewsBodyId.getBodyById(newsId: id);
      data = jsonDecode(data1);
      boolDownLoadData = true;
      notifyListeners();
    }catch(e){
   log(e.toString());
 }
  }
}
