import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e0_appbar.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e1_edu_type_tex.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e2_edu_lang.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e3_edu.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e4_edu_dir.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e5_edu_lang.dart';
import 'package:mydtm/view/texnikum/choose_edu/edu_widgets/e6_button.dart';
import 'package:mydtm/view/texnikum/choose_edu/provider_choose_edu_t.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';

class ChooseEduTexnikum extends StatefulWidget {
  const ChooseEduTexnikum({Key? key}) : super(key: key);

  @override
  State<ChooseEduTexnikum> createState() => _ChooseEduTexnikumState();
}

class _ChooseEduTexnikumState extends State<ChooseEduTexnikum> {
  ProviderChooseEduTexnikum providerChooseEduTexnikum =
      ProviderChooseEduTexnikum();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEduTexnikum,
      child: Consumer<ProviderChooseEduTexnikum>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: MyColors.appColorGrey100(),
          appBar: appBarEduTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
          body: SafeArea(
            child: providerChooseEduTexnikum.boolSetAllData?

            Container(
              margin: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyWidgets.robotoFontText(text: "Edu choose texnikum", textSize: 24),
                      const SizedBox(height: 10),
                      eduTypeTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
                      eduLangTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
                      eduTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
                      eduDirTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
                      eduLangDirTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum),
                      eduButtonTexnikum(context: context, providerChooseEduTexnikum: providerChooseEduTexnikum)
                      
                    ]),
              ),
            ) : const Center(child: CupertinoActivityIndicator(),),
          ),
        ),
      ),
    );
  }
}
