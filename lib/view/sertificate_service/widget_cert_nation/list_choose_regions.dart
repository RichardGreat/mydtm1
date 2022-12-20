import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/modal_get_reg.dart';

class ListChooseRegions extends StatefulWidget {
  List<ModelCertNationRegion> listCerRegions;

  ListChooseRegions({Key? key, required this.listCerRegions}) : super(key: key);

  @override
  State<ListChooseRegions> createState() => _ListChooseRegionsState();
}

class _ListChooseRegionsState extends State<ListChooseRegions> {
  @override
  Widget build(BuildContext context) {
    return

      ListView.builder(
      itemCount: widget.listCerRegions.length,
      itemBuilder: (context, index) =>
          Text(widget.listCerRegions[index].data.toString()),
    );
  }
}
