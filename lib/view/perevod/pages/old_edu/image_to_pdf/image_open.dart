// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydtm/view/perevod/pages/old_edu/provider_old_edu.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseImagesPerevod extends StatefulWidget {
  ProviderOldEdu providerOldEdu;
  Function function;

  ChooseImagesPerevod(
      {super.key, required this.providerOldEdu, required this.function});

  @override
  State<ChooseImagesPerevod> createState() => _ChooseImagesPerevodState();
}

class _ChooseImagesPerevodState extends State<ChooseImagesPerevod> {
  File? imageFile;
  String? nameImg;
  String? fileTypeName;
  String? img64;

  var box = Hive.box("online");

  @override
  initState() {
    widget.providerOldEdu.mbSizeZero = 0;

    if( widget.providerOldEdu.listImagesPDF.length >= 3){
      Navigator.of(context).pop();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(5),
          topLeft: Radius.circular(5),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.providerOldEdu.listImagesPDF.length < 3
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(),
                      // Container(
                      //     padding: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         border: Border.all(
                      //             color: MyColors.appColorBlue1(), width: 1)),
                      //     child: Column(
                      //       children: [
                      //         IconButton(
                      //             onPressed: () {
                      //               widget.providerOldEdu.listFiles.length <3?
                      //               _pickImage(ImageSource.camera):
                      //               Navigator.of(context).pop();
                      //             },
                      //             icon: Icon(Icons.add_a_photo_outlined,
                      //                 color: MyColors.appColorBlue1(),
                      //                 size: 25)),
                      //         Text(
                      //           "Camera",
                      //           style:
                      //               TextStyle(color: MyColors.appColorBlue1()),
                      //         )
                      //       ],
                      //     )),
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: MyColors.appColorBlue1(), width: 1)),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    widget.providerOldEdu.listFiles.length <3?
                                    _pickImage(ImageSource.gallery):
                                    Navigator.of(context).pop();
                                    // Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.add_photo_alternate_outlined,
                                    color: MyColors.appColorBlue1(),
                                    size: 25,
                                  )),
                              Text(
                                "Galery",
                                style:
                                    TextStyle(color: MyColors.appColorBlue1()),
                              )
                            ],
                          )),
                      Container(),
                    ],
                  )
                : MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    height: 40,
                    color: MyColors.appColorBackC4(),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text("access".tr()),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource imageSource) async {

    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    imageFile = pickedImage != null ? File(pickedImage.path) : null;
    if (imageFile != null) {
      setState(() {
        _cropImage();
      });
    }
  }

  num mb = 0;
  num mbSize = 0;

  Future<void> _cropImage() async {
    ImageCropper cropper = ImageCropper();
    final croppedFile = await cropper.cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "editImage".tr(),
              activeControlsWidgetColor: MyColors.appColorBlue1(),
              toolbarColor: MyColors.appColorBlue1(),
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: "editImage".tr(),
          )
        ]);
    if (croppedFile != null) {
      imageFile = File(croppedFile.path);
      nameImg = imageFile!.path;
      nameImg = imageFile!.path.split('image_cropper_').last;
      fileTypeName = imageFile!.path.split('.').last;
      final bytess = imageFile!.readAsBytesSync();
      img64 = base64Encode(bytess);
      final bytes = imageFile!.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      mb = kb / 1024;

      widget.providerOldEdu
          .getImageString(imageString: img64.toString().trim());
      widget.providerOldEdu.getImageFile(file: imageFile!);

      widget.providerOldEdu.getImageForPdf(
        image: Image.memory(
          base64Decode(img64.toString().trim()),
          fit: BoxFit.cover,
          height: 90,
        ),
      );
      widget.providerOldEdu.mbSizeZero = 0;
      for (var val in widget.providerOldEdu.listFiles) {
        final bytesSize = val.readAsBytesSync().lengthInBytes;
        final kbSize = bytesSize / 1024;
        mbSize = kbSize / 1024;
        widget.providerOldEdu.mbSizeZero += mbSize;
        if (widget.providerOldEdu.mbSizeZero > 7.8) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.topSlide,
            title: "${"imageMaxSize".tr()}" "${mb.toString().substring(0, 4)}",
            closeIcon: const Icon(Icons.build),
            btnOkColor: Colors.blueAccent,
            btnOkOnPress: () {
              // boolButtonChetTil = false;
              // booleanSeriyaChetTiliTrue = false;
              // _pickImage(widget.imageSource);
              // notifyListeners();
            },
          ).show();
        }
        widget.function();
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.topSlide,
        title: "${"imageMaxSize".tr()}" "${mb.toString().substring(0, 4)}",
        closeIcon: const Icon(Icons.build),
        btnOkColor: Colors.blueAccent,
        btnOkOnPress: () {
          // boolButtonChetTil = false;
          // booleanSeriyaChetTiliTrue = false;
          // _pickImage(widget.imageSource);
          // notifyListeners();
        },
      ).show();
      widget.function();
      // notifyListeners();
      // }
    }
  }
}
