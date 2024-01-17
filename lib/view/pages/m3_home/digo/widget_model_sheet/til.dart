import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_fan.dart';
import 'package:mydtm/view/pages/m3_home/digo/provider_digo.dart';

class GetDigoLang extends StatefulWidget {
  ProviderDigo providerDigo;

  GetDigoLang({super.key, required this.providerDigo});

  @override
  State<GetDigoLang> createState() => _GetRegionDigoState();
}

class _GetRegionDigoState extends State<GetDigoLang> {
  int dataState = 0;
  var dio = Dio();
  String errorText = "";
  ModelGetFan modelGetFan = ModelGetFan(status: "", data: []);

  @override
  void initState() {
    super.initState();
    getRegionAsync();
  }

  getRegionAsync() async {
    try{
      await widget.providerDigo
          .getLang(
              fan1Id: widget.providerDigo.fan1Id,
              fan2Id: widget.providerDigo.fan2Id)
          .then((value) {
        modelGetFan = value;
      });
    } on DioException catch(e){

    }
    setState(() {});
  }

  Widget bodyBuild(){
    if(widget.providerDigo.serverSideInfo == "0"){
      return const Center(child: CupertinoActivityIndicator(),);
    }else if(widget.providerDigo.serverSideInfo == "1"){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Til tanlang",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: modelGetFan.data.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    widget.providerDigo.setLang(
                        id: modelGetFan.data[index].id.toString(),
                        lang: modelGetFan.data[index].name.toString());

                    Navigator.of(context).pop();
                  },
                  minLeadingWidth: 0,
                  horizontalTitleGap: 0,
                  dense: true,
                  visualDensity:
                  const VisualDensity(horizontal: -2, vertical: -1),
                  leading: Text(
                    modelGetFan.data[index].name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ),
        ],
      );
    }else{
      return Center(child: Text(widget.providerDigo.serverSideInfo, textAlign: TextAlign.center),);
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: bodyBuild()
      ),
    );
  }
}
