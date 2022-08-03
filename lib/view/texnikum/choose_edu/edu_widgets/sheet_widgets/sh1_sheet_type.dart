import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

sheetEduTypeTexnikum({
  required BuildContext contexts,
  required ProviderChooseEduTexnikum providerChooseEduTexnikum,
}) {
  showModalBottomSheet(
      context: contexts,


      builder: (_) {
        return SizedBox(
        height: MediaQuery.of(contexts).size.height * 0.3,
          child: EduTypeTexnikumSheet(
            providerChooseEduTexnikum: providerChooseEduTexnikum,
            contexts: contexts,
          ),
        );
      });
}

// ignore: must_be_immutable
class EduTypeTexnikumSheet extends StatefulWidget {
  ProviderChooseEduTexnikum providerChooseEduTexnikum;
  BuildContext contexts;

  EduTypeTexnikumSheet({
    Key? key,
    required this.providerChooseEduTexnikum,
    required this.contexts,
  }) : super(key: key);

  @override
  State<EduTypeTexnikumSheet> createState() => _EduTypeTexnikumSheetState();
}

class _EduTypeTexnikumSheetState extends State<EduTypeTexnikumSheet> {
  Future getEduTypeTexnikum() async {
    await widget.providerChooseEduTexnikum.getEduType();
    setState((){});
  }

  @override
  initState() {
    getEduTypeTexnikum();
    super.initState();
  }

  @override
  Widget build(_) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: Container(
        child: widget.providerChooseEduTexnikum.boolEduTypeTexnikum
            ? Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.fromLTRB(8, 2, 5, 2),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: MyWidgets.robotoFontText(
                                    text: "chooseDirection".tr(),
                                    textSize: 24)),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(CupertinoIcons.chevron_down))
                          ]),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.providerChooseEduTexnikum.modeEduTexnikum.masseage.length,
                        itemBuilder: (context, index) => GestureDetector(
                          child: Card(
                            margin: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget
                                    .providerChooseEduTexnikum.modeEduTexnikum.masseage[index].name,
                                overflow: TextOverflow.fade,
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          onTap: () {
                            widget.providerChooseEduTexnikum.setEduTypeTexnikum(idType:  widget
                                .providerChooseEduTexnikum.modeEduTexnikum.masseage[index].id.toString(), nameType:  widget
                                .providerChooseEduTexnikum.modeEduTexnikum.masseage[index].name.toString());
                            setState(() {});
                            Navigator.of(context).pop();

                          },
                        ),
                      ),
                    ),
                  ],
                ))
            : MyWidgets.loaderDownload(context: context),
      ),
    );
  }
}
