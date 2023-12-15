import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/view/widgets/face_id/model/model_face.dart';
import 'package:ntp/ntp.dart';

class ResultPage extends StatefulWidget {
  String resulData;
  String base64;

  ResultPage({super.key, required this.resulData, required this.base64});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  void initState() {
    getDataParse();
    super.initState();
  }

  late ModelFaceNotRec modelFaceNotRec;
  late ModelFace modelFace;

  int faceSuccess = 0;
  var box = Hive.box("online");

  List<int> montDayCount = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  getDataParse() async {
    DateTime myTime = await NTP.now();
    try {
      modelFace = ModelFace.fromJson(jsonDecode(widget.resulData));
      setState(() {
        faceSuccess = 1;

        box.put("faceId", myTime.month.toString());
        box.put("faceIdDateMonth", myTime.month.toString());
        box.put("faceIdDateDay", myTime.day.toString());
      });
    } catch (e) {
      try {
        modelFaceNotRec =
            ModelFaceNotRec.fromJson(jsonDecode(widget.resulData));
        setState(() {
          faceSuccess = 2;
        });
      } catch (e) {
        faceSuccess = 3;
      }
    }
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        canPop: false,
        child: Center(
          child: SingleChildScrollView(
            child: faceSuccess == 1
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.memory(
                          base64Decode(widget.base64.substring(22)),
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "${modelFace.sname} ${modelFace.fname} ${modelFace.mname}",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent.shade400,
                        size: 70,
                      ),
                      const SizedBox(height: 20),
                      // MaterialButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).pop();
                      //   },
                      //   height: 50,
                      //   color: Colors.grey.shade300,
                      //   child: const Text("ORQAGA QAYTISH"),
                      // )
                    ],
                  ))
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.memory(
                            base64Decode(widget.base64.substring(22)),
                            fit: BoxFit.cover,
                            height: 300,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 80,
                        ),
                        Text(
                          modelFaceNotRec.status.toString() == "false"
                              ? "MOS MA'LUMOT TOPILMADI.\n BOSHQA YUZ TASVIRI"
                              : modelFaceNotRec.status.toString() == "null"
                                  ? "MOS MA'LUMOT TOPILMADI.\n  KIRITILGAN MA'LUMOTLARNI TO'G'RILIGINI TEKSHIRING"
                                  : modelFaceNotRec.status.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        // MaterialButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //     Navigator.of(context).pop();
                        //   },
                        //   height: 50,
                        //   color: Colors.grey.shade300,
                        //   child: const Text("ORQAGA QAYTISH"),
                        // )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
