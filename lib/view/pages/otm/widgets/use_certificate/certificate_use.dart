import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/use_certificate/body_certificate.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

sheetCertificateUse({
  required BuildContext contexts,
  required ProviderChooseEdu providerChooseEdu,
}) {
  showModalBottomSheet(
      context: contexts,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) {
        return CertificateUseCheck(
          providerChooseEdu: providerChooseEdu,
          context: contexts,
        );
      });
}

class CertificateUseCheck extends StatefulWidget {
  ProviderChooseEdu providerChooseEdu;
  BuildContext context;

  CertificateUseCheck(
      {Key? key, required this.providerChooseEdu, required this.context})
      : super(key: key);

  @override
  State<CertificateUseCheck> createState() => _CertificateUseCheckState();
}

class _CertificateUseCheckState extends State<CertificateUseCheck> {
  int selectedRadio = 0;

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.appColorWhite(),
        iconTheme: IconThemeData(color: MyColors.appColorWhite()),
      ),
      body: SafeArea(child: bodyCertificateOTM(context: context, providerChooseEdu:widget.providerChooseEdu))
    );
  }
}
