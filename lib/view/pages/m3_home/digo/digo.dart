import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/digo_2_kop.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo_main/digo_main.dart';
import 'package:mydtm/view/pages/m3_home/digo/provider_digo.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/fan1.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/fan2.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/region.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/son.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/til.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Digo extends StatefulWidget {
  const Digo({Key? key}) : super(key: key);

  @override
  _DigoState createState() => _DigoState();
}

class _DigoState extends State<Digo> {
  ProviderDigo providerDigo = ProviderDigo();
  bool _isLoading = true;
  // late PDFDocument document;

  loadDocument() async {
    // document = await PDFDocument.fromAsset('assets/fonts/digo.pdf');

    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    loadDocument();
    super.initState();
  }

 

  @override
  Widget build(BuildContext context1) {
    return ChangeNotifierProvider(
      create: (context) => providerDigo,
      child: Consumer<ProviderDigo>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title:  Text("digoTest".tr(),

                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20)),
              backgroundColor: Colors.teal,
            ),
            body: bodyBuild(context1)),
      ),
    );
  }
  Widget bodyBuild(BuildContext context1) {
    if (providerDigo.sentServer == "1") {
      return SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 2),
            child: ListView(
              children: [
                Visibility(
                    visible: providerDigo.regName.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          "province".tr(),
                          style:const TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1, providerDigo: providerDigo, index: 1);
                    },
                    leading: Text(
                        providerDigo.regName.isEmpty
                            ? "chooseRegion".tr()
                            : providerDigo.regName.toString(),
                        style:const TextStyle(fontSize: 18)),
                    trailing:const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                    visible: providerDigo.fan1Name.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          "firsSub".tr(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1, providerDigo: providerDigo, index: 2);
                    },
                    leading: Text(
                        providerDigo.fan1Name.isEmpty
                            ? "chooseFirsSub".tr()
                            : providerDigo.fan1Name,
                        style: const TextStyle(fontSize: 18)),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                    visible: providerDigo.fan2Name.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          "secondSub".tr(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1, providerDigo: providerDigo, index: 3);
                    },
                    leading: Text(
                        providerDigo.fan2Name.isEmpty
                            ? "secondSub".tr()
                            : providerDigo.fan2Name,
                        style: const TextStyle(fontSize: 18)),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                    visible: providerDigo.langName.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          "langTest".tr(),
                          style:const  TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1, providerDigo: providerDigo, index: 4);
                    },
                    leading: Text(
                        providerDigo.langName.isEmpty
                            ? "langTest".tr()
                            : providerDigo.langName,
                        style: const TextStyle(fontSize: 18)),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                    visible: providerDigo.countDigo.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child:  Text(
                          "countDigBooks".tr(),
                          style:const TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1, providerDigo: providerDigo, index: 5);
                    },
                    leading: Text(
                        providerDigo.countDigo.isEmpty
                            ? "countDigBooks".tr()
                            : providerDigo.countDigo,
                        style: const TextStyle(fontSize: 18)),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(providerDigo.countDigo.isEmpty
                      ? ""
                      : "${providerDigo.countDigo} x 20000 = ${providerDigo.textCostAllDigo} so'm"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (providerDigo.regName.isEmpty ||
                              providerDigo.fan1Name.isEmpty ||
                              providerDigo.fan2Name.isEmpty ||
                              providerDigo.langName.isEmpty ||
                              providerDigo.countDigo.isEmpty ||
                              providerDigo.countDigo == "0") {
                            getRegionSheet(
                                context: context1,
                                providerDigo: providerDigo,
                                index: providerDigo.countDigo == "0" ? 5 : 1);
                          } else if (providerDigo.countDigo.isEmpty ||
                              providerDigo.countDigo == "0") {
                            openKeyboard();
                          } else if (!providerDigo.boolGetTanishdim) {
                            providerDigo.boolColorRed();
                          } else if (providerDigo.boolGetTanishdim) {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Digo2DanKop(
                                    modelDigo2: ModelDigo2GetRegion(data: [
                                      DataDigo2GetRegion(
                                          idReg: providerDigo.regId,
                                          nameReg: providerDigo.regName,
                                          idFan1: providerDigo.fan1Id,
                                          nameFan1: providerDigo.fan1Name,
                                          idFan2: providerDigo.fan2Id,
                                          nameFan2: providerDigo.fan2Name,
                                          langId: providerDigo.langId,
                                          langName: providerDigo.langName,
                                          countDigo:
                                          providerDigo.countDigo.toString())
                                    ]),
                                  ),
                                ));
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        child:  Text("againOrder".tr(),
                            style:const TextStyle(
                                color: Colors.teal, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: getOferta,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40,
                      decoration: BoxDecoration(
                          color: providerDigo.boolGetTanishdimBackColor
                              ? Colors.white
                              : Colors.red.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: providerDigo.boolGetTanishdim,
                              activeColor: Colors.teal,
                              onChanged: (val) {}),
                          Text(
                            "seeAllOferta".tr(),
                            style:const TextStyle(
                                color: Colors.teal, fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () async {
                    if (providerDigo.regName.isEmpty ||
                        providerDigo.fan1Name.isEmpty ||
                        providerDigo.fan2Name.isEmpty ||
                        providerDigo.langName.isEmpty ||
                        providerDigo.countDigo.isEmpty ||
                        providerDigo.countDigo == "0") {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: providerDigo.countDigo == "0" ? 5 : 1);
                    } else if (!providerDigo.boolGetTanishdim) {
                      providerDigo.boolColorRed();
                    } else {
                      providerDigo.sendServer();
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.teal,
                  child:  Text("access".tr(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ));
    } else if (providerDigo.sentServer == "0") {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    } else if (providerDigo.sentServer == "2") {
      return const Center(
        child: Icon(
          Icons.check_circle_outline,
          size: 90,
          color: Colors.teal,
        ),
      );
    } else if (providerDigo.sentServer == "3") {
      return Center(
        child: Container(
          margin:const EdgeInsets.fromLTRB(30, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 20),
              Text("successOrder".tr(),
                  style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "province".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(providerDigo.regName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "idNumber".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                        providerDigo.modelGetNatija.data[0].id.toString(),
                        style:const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "countAllBooks".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(providerDigo.countDigo.toString(),
                        style:const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
              const  SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                        "allCost".tr(),
                        style:const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text("${providerDigo.textCostAllDigo} so'm",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start),
                  )
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  Clipboard.setData(ClipboardData(
                    text: providerDigo.modelGetNatija.data[0].invoice.toString(),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text("${"copy".tr()} ${providerDigo.modelGetNatija.data[0].invoice}",
                      )));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(

                          "invoice".tr(),
                          textAlign: TextAlign.start,
                          style:const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text(
                          providerDigo.modelGetNatija.data[0].invoice.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start),
                    ),
                    const Icon(Icons.copy)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: (){
                  Clipboard.setData(ClipboardData(
                    text: providerDigo.modelGetNatija.data[0].invoice.toString(),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text("${"copy".tr()} ${providerDigo.modelGetNatija.data[0].invoice.toString()}",
                      )));
                },
                child: QrImageView(
                  data:providerDigo.modelGetNatija.data[0].invoice.toString(),
                  version: QrVersions.auto,
                  size: 100.0,
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.5,
                height: 50,
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () {
                Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => DigoMain(),), (route) => false);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("goBack2".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),

            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(providerDigo.sentServer,
                textAlign: TextAlign.center, maxLines: 4),
            const SizedBox(height: 10),
            const Text("Xatolik"),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                providerDigo.getDefault();
              },
              color: Colors.white,
              minWidth: 200,
              height: 50,
              child: const Text("Qayta urinish",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      );
    }
  }

  FocusNode inputNode = FocusNode();

// to open keyboard call this function;
  void openKeyboard() {
    FocusScope.of(context).autofocus(inputNode);
    // FocusScope.of(context).requestFocus(inputNode);
  }

  getRegionSheet(
      {required BuildContext context,
      required ProviderDigo providerDigo,
      required int index}) {
    showModalBottomSheet(
        context: context,
        enableDrag: true,
        elevation: 0,
        backgroundColor: Colors.white,
        builder: (context) => Container(
              color: Colors.white,
              margin: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.8,
              child: digoById(index: index),
            ));
  }

  Widget digoById({required int index}) {
    if (providerDigo.regName.isEmpty) {
      index = 1;
    } else if (providerDigo.fan1Name.isEmpty) {
      index = 2;
    } else if (providerDigo.fan2Name.isEmpty) {
      index = 3;
    } else if (providerDigo.langName.isEmpty) {
      index = 4;
    } else if (providerDigo.countDigo.isEmpty) {
      index = 5;
    }

    switch (index) {
      case 1:
        return GetRegionDigo(providerDigo: providerDigo);

      case 2:
        return GetDigoFan(providerDigo: providerDigo);
      case 3:
        return GetDigoFan2(providerDigo: providerDigo);
      case 4:
        return GetDigoLang(providerDigo: providerDigo);
      case 5:
        return SonKiritish11(providerDigo: providerDigo);
      default:
        return const SizedBox.shrink();
    }
  }

  getOferta() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Theme(
            data:
                Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              elevation: 0,
              content: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        child: const PDF(
                          enableSwipe: true,
                          autoSpacing: false,
                          fitEachPage: true,
                          fitPolicy: FitPolicy.BOTH,

                        ).fromAsset("assets/fonts/digo.pdf"),
              ),
              actions: [
                TextButton(
                  child:  Text("goBack".tr(),
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold)),
                  onPressed: () {

                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child:  Text("seeOferta".tr(),
                      style: const TextStyle(
                          color: Colors.teal, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    providerDigo.boolGetTanishdimFunc();
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
      },
    );
  }
}
