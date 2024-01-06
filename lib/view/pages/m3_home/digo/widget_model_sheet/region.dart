import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_digo_region.dart';
import 'package:mydtm/view/pages/m3_home/digo/provider_digo.dart';

class GetRegionDigo extends StatefulWidget {
  ProviderDigo providerDigo;

  GetRegionDigo({super.key, required this.providerDigo});

  @override
  State<GetRegionDigo> createState() => _GetRegionDigoState();
}

class _GetRegionDigoState extends State<GetRegionDigo> {
  int dataState = 0;
  var dio = Dio();
  String errorText = "";
  ModelGetRegion modelGetFan = ModelGetRegion(status: "", data: []);

  @override
  void initState() {
    super.initState();
    getRegionAsync();
  }

  getRegionAsync() async {
    await widget.providerDigo.getRegion().then((value) {
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
                "Hududingizni tanlang",
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
                      widget.providerDigo.setRegId(
                          id: modelGetFan.data[index].id.toString(),
                          name: modelGetFan.data[index].name.toString());
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
