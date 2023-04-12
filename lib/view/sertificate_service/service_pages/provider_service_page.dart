import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_cert_view.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/model_cert_application.dart';

class ProviderServiceApplicationPage extends ChangeNotifier {
  var box = Hive.box("online");
  List<DataCertApplications> listCertApp = [];
  bool boolDownloadData = false;
  bool boolDownloadDataError = false;

  NetworkCertificateView networkCertificateView = NetworkCertificateView();

  Future getCertificateService({required String serviceIds}) async {
    try {
      boolDownloadData = false;

      notifyListeners();
      String data = await networkCertificateView.getCertView(
          testLang: box.get("language") == "1"
              ? "uz"
              : box.get("language") == "2"
                  ? 'kk'
                  : 'ru',
          serviceID: serviceIds);
      listCertApp = ModelCertApplications.fromJson(jsonDecode(data)).data;
      boolDownloadDataError = true;
      boolDownloadData = true;
      notifyListeners();
    } catch (e) {
      boolDownloadDataError = true;
      notifyListeners();
      log(e.toString());
    }
  }
}
