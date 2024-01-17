import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mydtm/view/pages/m3_home/digo/digo2/provider_digo2.dart';
import 'package:easy_localization/easy_localization.dart';

class SonKiritish extends StatefulWidget {
  ProviderDigo2 providerDigo;
  int indexList;

  SonKiritish({super.key, required this.indexList, required this.providerDigo});

  @override
  State<SonKiritish> createState() => _SonKiritishState();
}

class _SonKiritishState extends State<SonKiritish> {
  final _keyDigoSon = GlobalKey<FormState>();
  final txtDigo2Controller = TextEditingController();

  bool onActionDigo() {
    try {
      return _keyDigoSon.currentState!.validate();
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   SizedBox(
                    // width: MediaQuery.of(context).size.width*0.7,
                    child: Text("booksCount".tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  TextButton(
                      onPressed: () {

                        try{
                          if( int.parse(txtDigo2Controller.text) != 0){}
                          else{
                            txtDigo2Controller.text = "";
                          }
                          onActionDigo()
                              ? widget.providerDigo.setSonDigo2(
                              indexList: widget.indexList,
                              son2:    widget.providerDigo.setSonDigo2(
                                  indexList: widget.indexList,
                                  son2: txtDigo2Controller.text.toString() !=
                                      "0" ||
                                      txtDigo2Controller.text
                                          .toString() !=
                                          "00" ||
                                      txtDigo2Controller.text
                                          .toString() !=
                                          "000" ||
                                      txtDigo2Controller.text
                                          .toString() !=
                                          "0000"
                                      ? txtDigo2Controller.text
                                      .trim()
                                      .toString()
                                      : "")
                          )
                              : {};

                        }catch(e){};

                        onActionDigo()
                            ? {
                                widget.providerDigo.setSonDigo2(
                                    indexList: widget.indexList,
                                    son2: txtDigo2Controller.text.toString() !=
                                                "0" ||
                                            txtDigo2Controller.text
                                                    .toString() !=
                                                "00" ||
                                            txtDigo2Controller.text
                                                    .toString() !=
                                                "000" ||
                                            txtDigo2Controller.text
                                                    .toString() !=
                                                "0000"
                                        ? txtDigo2Controller.text
                                            .trim()
                                            .toString()
                                        : "")
                              }
                            : {};
                        onActionDigo() ? Navigator.of(context).pop() : {};
                      },
                      child:  Text(
                        "access".tr(),
                        style:const TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
              const SizedBox(height: 15),
              Form(
                key: _keyDigoSon,
                child: Column(
                  children: [
                    TextFormField(
                      controller: txtDigo2Controller,
                      autofocus: true,
                      maxLines: 1,
                      maxLength: 4,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                      onTapOutside: (val) {

                        try{
                          if( int.parse(txtDigo2Controller.text) != 0){}
                          else{
                            txtDigo2Controller.text = "";
                          }
                          onActionDigo()
                            ? widget.providerDigo.setSonDigo2(
                            indexList: widget.indexList,
                            son2: txtDigo2Controller.text.toString() !=
                                "0" ||
                                txtDigo2Controller.text
                                    .toString() !=
                                    "00" ||
                                txtDigo2Controller.text
                                    .toString() !=
                                    "000" ||
                                txtDigo2Controller.text
                                    .toString() !=
                                    "0000"
                                ? txtDigo2Controller.text
                                .trim()
                                .toString()
                                : ""
                               )
                            : {};

                        }catch(e){}

                      },
                      validator: (value) {
                        try {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value == "0") {
                            return "enterNumg".tr();
                          }
                        } catch (e) {
                          log("12");
                          log(e.toString());
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "enterNum".tr(),
                          labelStyle: const TextStyle(color: Colors.teal),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: 10,
                              borderSide: const BorderSide(color: Colors.red)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.grey.shade200),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
