// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/face_id/result_page.dart';

class ImagePhoto extends StatefulWidget {
  String imie, pser, snum;

  ImagePhoto(
      {super.key, required this.imie, required this.pser, required this.snum});

  @override
  State<ImagePhoto> createState() => _ImagePhotoState();
}

class _ImagePhotoState extends State<ImagePhoto> {
  File? _capturedImage;
  bool boolSendServer = false;
  bool boolImage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: !boolSendServer
              ? const Text(
                  "Yuz markazda bo'lsin",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 124, 128, 1),
                      fontWeight: FontWeight.bold),
                )
              : const Text(
                  "Ma'lumot aniqlanmoqda",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 194, 198, 1),
                      fontWeight: FontWeight.bold),
                ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: boolSendServer
            ? Container(
                color: Colors.white, //.fromRGBO(0, 34,38,1),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Text("Ma'lumot aniqlanmoqda", style: TextStyle(color: Colors.white),),
                        Image.asset(
                          "assets/images/imag.gif",
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.5,
                          // width: MediaQuery.of(context).size.width ,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Builder(builder: (context) {
                if (_capturedImage != null) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.file(
                          _capturedImage!,
                          width: double.maxFinite,
                          fit: BoxFit.fitWidth,
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                setState(() => _capturedImage = null),
                            child: const Text(
                              "Rasmga yana olish",

                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                  );
                }
                return SmartFaceCamera(
                    autoCapture: true,
                    defaultCameraLens: CameraLens.front,
                    enableAudio: false,
                    showFlashControl: false,
                    captureControlIcon: Container(
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 94, 98, 1),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.photo_camera,
                            size: 32,
                            color: Colors.white,
                          ),
                        )),
                    lensControlIcon: Container(
                        height: 100,
                        // padding: const EdgeInsets.all(10),
                        // margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(0, 94, 98, 1),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.flip_camera_ios_sharp,
                            size: 25,
                            color: Colors.white,
                          ),
                        )),
                    // orientation: CameraOrientation.portraitUp,
                    onCapture: (File? image) async {
                      setState(() => _capturedImage = image);
                      List<int> imageBytes = await image!.readAsBytes();
                      String base64Image = base64Encode(imageBytes);
                      setState(() {
                        boolSendServer = true;
                      });
                      await getData(
                          imie: widget.imie,
                          seria: "${widget.pser}${widget.snum}",
                          image64: "data:image/jpg;base64,$base64Image");
                      setState(() {
                        boolSendServer = false;
                      });
                      SnackBar(
                          backgroundColor: Colors.black,
                          duration: const Duration(seconds: 2),
                          content: MyWidgets.robotoFontText(
                              text: "Ma’lumotlarni to'griligini tekshiring",
                              textFontWeight: FontWeight.bold,
                              textColor: Colors.black));
                    },
                    onFaceDetected: (Face? face) {
                      //Do something
                    },
                    messageBuilder: (context, face) {
                      if (face == null) {
                        return _message('Yuz qismi kameraga qarasin');
                      }
                      if (!face.wellPositioned) {
                        return _message("Yuz markazda bo'lsin");
                      }
                      return const SizedBox.shrink();
                    });
              }));
  }

  Future getData(
      {required String imie,
      required String seria,
      required String image64}) async {
    var dio = Dio();
    Response response;
    try {
      log("###2");
      response = await dio.post("https://faceid.uzbmb.uz/api_v2/face/",
          data: {"seria": seria, "jshshir": imie, "image_base64": image64},
          options: Options(headers: {
            "Authorization": "Token 99bec1712c07ddc40441cfebee63fc59ae10ee8c"
          }));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.black,
      //     duration: const Duration(seconds: 2),
      //     content: MyWidgets.robotoFontText(
      //         text: jsonEncode(response.data).toString(),
      //         textFontWeight: FontWeight.bold,
      //         textColor: Colors.white)));
      Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ResultPage(
                resulData: jsonEncode(response.data).toString(),
                base64: image64,
              )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 2),
          content: MyWidgets.robotoFontText(
              text: e.toString(),
              textFontWeight: FontWeight.bold,
              textColor: Colors.black)));
    }
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
      );
}
