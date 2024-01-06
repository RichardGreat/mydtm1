import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/digo_2_kop.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:mydtm/view/pages/m3_home/digo/provider_digo.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/fan1.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/fan2.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/region.dart';
import 'package:mydtm/view/pages/m3_home/digo/widget_model_sheet/til.dart';
import 'package:provider/provider.dart';

class Digo extends StatefulWidget {
  const Digo({Key? key}) : super(key: key);

  @override
  _DigoState createState() => _DigoState();
}

class _DigoState extends State<Digo> {
  ProviderDigo providerDigo = ProviderDigo();

  @override
  Widget build(BuildContext context1) {
    return ChangeNotifierProvider(
      create: (context) => providerDigo,
      child: Consumer<ProviderDigo>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("DIGO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20)),
            backgroundColor: Colors.teal,
          ),
          body: SafeArea(
              child: Container(
            padding:
                const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 2),
            child: ListView(
              children: [
                Visibility(
                    visible: providerDigo.regName.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Hudud",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: 1);
                    },
                    leading: Text(
                        providerDigo.regName.isEmpty
                            ? "Hudud tanlang"
                            : providerDigo.regName.toString(),
                        style: TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                    visible: providerDigo.fan1Name.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "1-Fan",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: 2);
                    },
                    leading: Text(
                        providerDigo.fan1Name.isEmpty
                            ? "1-fan tanlang"
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
                        child: const Text(
                          "2-Fan",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: 3);
                    },
                    leading: Text(
                        providerDigo.fan2Name.isEmpty
                            ? "2-fan tanlang"
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
                        child: const Text(
                          "Test topshirish tili",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Card(
                  color: Colors.white,
                  shadowColor: Colors.teal.shade300,
                  elevation: 1.5,
                  child: ListTile(
                    onTap: () {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: 4);
                    },
                    leading: Text(
                        providerDigo.langName.isEmpty
                            ? "Test topshirish tili"
                            : providerDigo.langName,
                        style: const TextStyle(fontSize: 18)),
                    trailing: const Icon(Icons.keyboard_arrow_down_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                    visible:
                        providerDigo.textEditControllerDigo.text.isNotEmpty,
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Test topshiriq kitob soni",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))),
                Container(
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      boxShadow: const [
                        BoxShadow(color: Colors.teal),
                      ],
                      border: Border.all(
                          color: Colors.teal.shade200,
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignInside),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: providerDigo.textEditControllerDigo,
                    maxLines: 1,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    enableInteractiveSelection: false,
                    focusNode: inputNode,
                    decoration: const InputDecoration(
                        border: InputBorder.none, counter: SizedBox.shrink()),
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    autofocus: true,
                    onChanged: (val) {
                      try {
                        val.isEmpty
                            ? providerDigo.getNumCost(numDigo: 0)
                            : providerDigo.getNumCost(numDigo: int.parse(val));
                      } catch (e) {
                        providerDigo.textEditControllerDigo.text = "";
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, top: 5),
                  child: Text(providerDigo.textCostNumber.isEmpty
                      ? ""
                      : "${providerDigo.textCostNumber} x 20000 = ${providerDigo.textCostAllDigo} so'm"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
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
                                        countDigo: providerDigo
                                            .textEditControllerDigo.text
                                            .toString())

                                  ]),
                                ),
                              ));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        child: const Text("+ Yana buyrutma berish",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  onPressed: () {
                    if (providerDigo.regName.isEmpty ||
                        providerDigo.fan1Name.isEmpty ||
                        providerDigo.fan2Name.isEmpty ||
                        providerDigo.langName.isEmpty) {
                      getRegionSheet(
                          context: context1,
                          providerDigo: providerDigo,
                          index: 1);
                    } else if (providerDigo
                            .textEditControllerDigo.text.isEmpty ||
                        providerDigo.textEditControllerDigo.text == "0") {
                      openKeyboard();
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     content: Text('A SnackBar has been shown.'),
                      //   ),
                      // );
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.teal,
                  child: const Text("Tasdiqlash",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )),
        ),
      ),
    );
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
      default:
        return const SizedBox.shrink();
    }
  }
}
