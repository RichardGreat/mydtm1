import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/internet_connections/check_certificate/check_cert_internet.dart';
import 'package:mydtm/data/model_parse/check_certificates/model_check_certificate.dart';

class ProviderCheckCertificate extends ChangeNotifier {
  List<ModelCheckCertificate> modelCheckCert = [];
  bool boolGetCertInfo = false;
  final InternetCheckCert _internetCheckCert = InternetCheckCert();
  var box = Hive.box("online");
  TextEditingController textEditingController = TextEditingController();
  bool boolJShShIR = false;
  bool myBoolWidget = false;
  var formKey123 = GlobalKey<FormState>();


  Future boolShShIR({required bool boolShiR}) async {
    boolJShShIR = boolShiR;
    notifyListeners();
  }

  Future checkDataCertificate() async {
    try {
      boolGetCertInfo = false;
      log(box.get("imie").toString());
      modelCheckCert = await _internetCheckCert.getData(pnfl:box.get("imie"));

      boolGetCertInfo = true;

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
