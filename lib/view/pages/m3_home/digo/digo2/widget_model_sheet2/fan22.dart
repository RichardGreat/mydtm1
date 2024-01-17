import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_fan.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:easy_localization/easy_localization.dart';

class GetDigoFan22 extends StatefulWidget {
  ProviderDigo2 providerDigo;
  int indexList;

  GetDigoFan22(
      {super.key, required this.providerDigo, required this.indexList});

  @override
  State<GetDigoFan22> createState() => _GetRegionDigoState();
}

class _GetRegionDigoState extends State<GetDigoFan22> {
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
    await widget.providerDigo
        .getFan2(
            fan1Id:
                widget.providerDigo.modelDigo2.data[widget.indexList].idFan1)
        .then((value) {
      modelGetFan = value;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: bodyBuild());
  }

  Widget bodyBuild() {
    /// loading
    if (widget.providerDigo.serverSideInfo == "0") {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (widget.providerDigo.serverSideInfo == "1") {
      /// success
      return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding:const EdgeInsets.all(8.0),
              child: Text(
                "secondSub".tr(),
                style: const TextStyle(
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
                      widget.providerDigo.setFan2(
                          indexList: widget.indexList,
                          fan2Name: modelGetFan.data[index].name.toString(),
                          fan2Id: modelGetFan.data[index].id.toString());
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      /// error
    } else {
      /// error
      return Center(
        child: Text(widget.providerDigo.serverSideInfo.toString(),
            textAlign: TextAlign.center),
      );
    }
  }
}
