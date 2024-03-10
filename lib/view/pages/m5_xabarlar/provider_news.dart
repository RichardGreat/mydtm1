import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/internet_connections/m5_news/internet_news.dart';
import 'package:mydtm/data/internet_connections/m5_news/network_nws_body.dart';
import 'dart:developer';

import 'package:mydtm/data/model_parse/m5_model/model_news.dart';
import 'package:mydtm/data/model_parse/m5_model/model_notifications_all.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ProviderDtmNews extends ChangeNotifier {

  late ModelDtmNews modelDtmNews;
  List<ModelDtmNews> modelDtmNews2 = [];
  List<ModelDtmNews> modelDtmNews3Temp = [];
  bool boolDtmNews = false;
  var box = Hive.box("online");
  String langNames="";

  Future getAllDtmNews() async {
    try {
      boolDtmNews = false;
      getLang(); /// get local lang
      String dataNews = await NetworkDtmNews.getCheckDownloads(langName: langNames.isEmpty ?"uz": langNames);
      modelDtmNews2 = (jsonDecode(dataNews) as List).
      map((e)=>ModelDtmNews.fromJson(e)).toList();
      modelDtmNews3Temp.addAll(modelDtmNews2);
      modelDtmNews3Temp.sort((b,a) => a.views.compareTo(b.views));
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
      getLang(); /// get local lang
      String data1 = await NetworkNewsBodyId.getBodyById(newsId: id, languageName: langNames);
      data = jsonDecode(data1);
      boolDownLoadData = true;
      notifyListeners();
    }catch(e){
   log(e.toString());
 }
  }

  Future getLang()async{
    if(box.get("language")=="1"){
      langNames = "uz";
      notifyListeners();
    }else if(box.get("language")=="2"){
      langNames = "qr";
      notifyListeners();
    }
    else if(box.get("language")=="3"){
      langNames = "ru";
      notifyListeners();
    }
  }

  List<ModelNotificationAll> listNotificationAll = [];
  dynamic listData = "";
  final channel = WebSocketChannel.connect(Uri.parse("wss://uzbmb.uz/websockets"));

 Future getNotificationAll() async{


    try{
      boolDownLoadData = false;

      await channel.ready;
      // channel.stream.listen(
      //       (message) {
      //     try {
      //       channel.sink.add(
      //           "{\"action\": \"get\", \"data\": \"${box.get("imie").toString()}\"}");
      //         listData = message;
      //     } catch (e) {
      //       log(e.toString());
      //
      //     }
      //   },
      // );
      log("listData.toString()");
      log(listData.toString());
      listNotificationAll = (jsonDecode(listData) as List).map((e) => ModelNotificationAll.fromJson(e)).toList();
      boolDownLoadData = true;
      notifyListeners();
    }catch(e){
      log(e.toString());
    }
 }

 Future clotheSocket()async{
   try{

     channel.sink.close();
   }catch(e){
     log(e.toString());
   }
 }

}
