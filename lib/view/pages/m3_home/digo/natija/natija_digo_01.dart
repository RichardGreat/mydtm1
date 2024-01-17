import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/digo/model_server_natija.dart';

class NatijaDigo01 extends StatefulWidget {
  late ModelGetNatija modelGetNatija;
   NatijaDigo01({super.key, required this.modelGetNatija});

  @override
  State<NatijaDigo01> createState() => _NatijaDigo01State();
}

class _NatijaDigo01State extends State<NatijaDigo01> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Buyrutma qabul qilindi"),
              Text(widget.modelGetNatija.data[0].phone.toString()),
              Text(widget.modelGetNatija.data[0].cnt.toString()),
              Text(widget.modelGetNatija.data[0].imie.toString()),
              Text(widget.modelGetNatija.data[0].createAt.toString()),

            ],
          ),
        ),
      ),
    );
  }
}
