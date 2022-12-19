import 'package:flutter/foundation.dart';
import 'package:mydtm/data/internet_connections/certificate_nation/get_regions.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/modal_get_reg.dart';

class ProviderCertificateService extends ChangeNotifier{

  List<ModelCertNationRegion> listCerRegions =[];
  NetworkGetRegionCertNation getRegionCertNation = NetworkGetRegionCertNation();
  bool boolGetSerRegion = false;

  Future getDateServiceCertificate()async{
    boolGetSerRegion = false;
    listCerRegions = await getRegionCertNation.getRegion();
    boolGetSerRegion = true;
    notifyListeners();


  }



}