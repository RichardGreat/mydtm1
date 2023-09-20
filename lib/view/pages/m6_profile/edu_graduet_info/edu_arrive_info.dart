import 'package:flutter/material.dart';

class EduArriveInfo extends StatefulWidget {
  const EduArriveInfo({super.key});

  @override
  State<EduArriveInfo> createState() => _EduArriveInfoState();
}

class _EduArriveInfoState extends State<EduArriveInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: Center(
        child: Text(""),
      )),
    );
  }
}
