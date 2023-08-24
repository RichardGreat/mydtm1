import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckCertificate extends StatefulWidget {
  const CheckCertificate({super.key});

  @override
  State<CheckCertificate> createState() => _CheckCertificateState();
}

class _CheckCertificateState extends State<CheckCertificate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkCertificate".tr()),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal,
                  Colors.teal,
                  Colors.teal.withOpacity(0.8),
                  Colors.teal.withOpacity(0.7),
                ]),
          ),
        ), ),
      body: Center(child: Text("workSoon".tr(), style:  TextStyle(
          color: Colors.grey.shade500,
          fontWeight: FontWeight.w600),)),
    );
  }
}
