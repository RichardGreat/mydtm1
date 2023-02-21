import 'package:flutter/material.dart';
import 'package:mydtm/data/model_parse/mod_certificate_nation/modal_get_reg.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class ListChooseRegions extends StatefulWidget {
  Map<String, String> listCerRegions;

  ListChooseRegions({Key? key, required this.listCerRegions}) : super(key: key);

  @override
  State<ListChooseRegions> createState() => _ListChooseRegionsState();
}

class _ListChooseRegionsState extends State<ListChooseRegions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text("Hududni talang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        Expanded(child: ListView.builder(
          itemCount: widget.listCerRegions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 8, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: MyColors.appColorGrey400(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 8, 0),
                  child: Text(widget.listCerRegions.values.elementAt(index)),
                ),
              ],
            ),
          ),
        ),)

      ],
    );
  }
}
