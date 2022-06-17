import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/otm/provider_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/app_bar_choose_edu.dart';
import 'package:mydtm/view/pages/otm/widgets/body_choose_edu.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:provider/provider.dart';

class ChooseEdu extends StatefulWidget {
  Function funcState;
  ChooseEdu({Key? key,  required this.funcState}) : super(key: key);

  @override
  State<ChooseEdu> createState() => _ChooseEduState();
}

class _ChooseEduState extends State<ChooseEdu> {
  ProviderChooseEdu providerChooseEdu = ProviderChooseEdu();
  var box = Hive.box("online");

  @override
  initState(){
    providerChooseEdu.getCheckUseNationCertInfo();

    super.initState();
  }

   double heightScreen(){
     if(MediaQuery.of(context).size.height >= 800){
       return MediaQuery.of(context).size.height*1.33;
     }else if(MediaQuery.of(context).size.height < 800 && MediaQuery.of(context).size.height >= 700){
       return MediaQuery.of(context).size.height*1.53;
     }
   else if(MediaQuery.of(context).size.height < 700 && MediaQuery.of(context).size.height >= 600){
  return MediaQuery.of(context).size.height*1.63;
  }
     else if(MediaQuery.of(context).size.height < 600 && MediaQuery.of(context).size.height >= 500){
       return MediaQuery.of(context).size.height*1.83;
     }
     else if(MediaQuery.of(context).size.height < 500 && MediaQuery.of(context).size.height >= 400){
       return MediaQuery.of(context).size.height*2.53;
     }
    return 700;
   }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerChooseEdu,
      child: Consumer<ProviderChooseEdu>(
        builder: (contexts, value, child) => WillPopScope(
            onWillPop: ()async{
              widget.funcState();
              return true;
            },
          child: Scaffold(
            appBar: appBarEduChoose(
                context: contexts, providerChooseEdu: providerChooseEdu),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: heightScreen(),
                  margin: const EdgeInsets.all(15),
                  child:
                  providerChooseEdu.boolCheckUseCertificateData ?

                  bodyChooseEdu(
                      context: context, providerChooseEdu: providerChooseEdu):MyWidgets.loaderDownload(context: context),
                ),
              ),
            )),),
      ),
    );
  }
}
