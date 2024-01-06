import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_fan.dart';
import 'package:mydtm/view/pages/m3_home/digo/provider_digo.dart';

class GetDigoFan2 extends StatefulWidget {
  ProviderDigo providerDigo;

  GetDigoFan2({super.key, required this.providerDigo});

  @override
  State<GetDigoFan2> createState() => _GetRegionDigoState();
}

class _GetRegionDigoState extends State<GetDigoFan2> {
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
        .getFan2(fan1Id: widget.providerDigo.fan1Id)
        .then((value) {
      modelGetFan = value;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "2-Fani tanlang",
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
                      widget.providerDigo
                          .setFan2Id(
                          fan2: modelGetFan.data[index].name.toString(),
                          id: modelGetFan.data[index].id.toString());
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
      ),
    );
  }
}
