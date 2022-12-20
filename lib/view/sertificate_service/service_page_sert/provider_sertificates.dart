import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_regions.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/modal_get_reg.dart';
import 'package:mydtm/view/sertificate_service/widget_cert_nation/list_choose_regions.dart';

class ProviderCertificateService extends ChangeNotifier {
  List<ModelCertNationRegion> listCerRegions = [];
  NetworkGetRegionCertNation getRegionCertNation = NetworkGetRegionCertNation();
  bool boolGetSerRegion = false;

  Future getDateServiceCertificate({required BuildContext context}) async {
    boolGetSerRegion = false;
    listCerRegions = await getRegionCertNation.getRegion();
    boolGetSerRegion = true;
    getButtonSheet(context: context);

    notifyListeners();
  }

  Future getButtonSheet({
    required BuildContext context,
  }) async {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext context) {
          return ListChooseRegions(listCerRegions: listCerRegions);
        });
  }
}
