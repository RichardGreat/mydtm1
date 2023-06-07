// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
// ignore: must_be_immutable
class ChooseImageForeignLang extends StatefulWidget {
  ProviderCertificate providerCertificate;
  Function f;
  ChooseImageForeignLang({Key? key, required this.providerCertificate, required this.f})
      : super(key: key);

  @override
  State<ChooseImageForeignLang> createState() => _ChooseImageForeignLangState();
}

class _ChooseImageForeignLangState extends State<ChooseImageForeignLang> {
  File? imageFile;
  String? nameImg;
  String? fileTypeName;
  String? img64;

  var box = Hive.box("online");

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
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
                              _pickImage(ImageSource.camera);
                            },
                            icon: Icon(Icons.add_a_photo_outlined,
                                color: MyColors.appColorBlue1(), size: 25)),
                        Text(
                          "camera".tr(),
                          style: TextStyle(color: MyColors.appColorBlue1()),
                        )
                      ],
                    )),
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
                              _pickImage(ImageSource.gallery);
                            },
                            icon: Icon(
                              Icons.add_photo_alternate_outlined,
                              color: MyColors.appColorBlue1(),
                              size: 25,
                            )),
                        Text(
                          "gallery".tr(),
                          style: TextStyle(color: MyColors.appColorBlue1()),
                        )
                      ],
                    )),
                Container(),
              ],
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
      final mb = kb / 1024;
      log(bytes.toString());
      log(kb.toString());
      log(mb.toString());
      // setState(() {
      // });
      // final bytes = imageFile!.readAsBytesSync().lengthInBytes;
      // final kb = bytes / 1024;
      // final mb = kb / 1024;
      if (mb <= 8) {
        widget.providerCertificate
            .changeImageForeign(imageData: img64, imageFile: imageFile!, fileTypeName: fileTypeName!, fff:widget.f);

        Navigator.pop(context);
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.topSlide,
          title:
              "${"imageSize".tr()} ${mb.toString().substring(0, 4)}",
          closeIcon: const Icon(Icons.build),
          btnOkColor: Colors.blueAccent,
          btnOkOnPress: () {
            // boolButtonChetTil = false;
            // booleanSeriyaChetTiliTrue = false;
            // _pickImage(widget.imageSource);
            // notifyListeners();
          },
        ).show();
        // notifyListeners();
      }
    }
  }
}
