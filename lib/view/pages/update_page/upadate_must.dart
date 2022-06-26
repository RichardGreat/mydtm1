import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

class UpdateMust extends StatefulWidget {
  const UpdateMust({Key? key}) : super(key: key);

  @override
  State<UpdateMust> createState() => _UpdateMustState();
}

class _UpdateMustState extends State<UpdateMust> {
var box = Hive.box("online");
  @override
  initState(){
    Future.delayed(Duration.zero);
    box.put("updateMust","3");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:  Scaffold(body: Container(child: Center(child: Text(box.get("updateMobileText")),)),), onWillPop: ()async{
      if (Platform.isIOS) {
        exit(0);
      } else {
        SystemNavigator.pop();
      }
      return true;
    });
  }
}
