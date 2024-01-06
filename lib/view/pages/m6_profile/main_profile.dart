// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mydtm/view/pages/m6_profile/provider_profile.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/app_bar.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/body_no_profile_info.dart';
import 'package:mydtm/view/pages/m6_profile/widget_main_profile/body_profile.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:ntp/ntp.dart';
import 'package:provider/provider.dart';

class MainProfile extends StatefulWidget {
  late Function myFunction;
   MainProfile({super.key, required this.myFunction});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  ProviderProfile providerProfile = ProviderProfile();
  var box = Hive.box("online");


late DateTime dateTime;
  Future getProfileInfo()async{
    timerM();
    await providerProfile.getProfile();
    dateTime= await NTP.now();
    setState((){});
  }

  getStateFunction(){
    setState((){});
  }


  @override
  initState() {

    getProfileInfo();
    super.initState();
  }



  timerM() async {
    DateTime myTime;
    myTime = await NTP.now();
    List<int> monthDayCount = [
      0,
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    // box.put("faceIdDateMonth", "11");
    // box.put("faceIdDateDay", "27");
    // box.put("faceId", "1");
    // log("faceIdDateMonth :: ${box.get("faceIdDateMonth")}");
    // log("faceIdDateDay :: ${box.get("faceIdDateDay")}");
    int month = int.parse(box.get("faceIdDateMonth") ?? "12".toString());
    int day = int.parse(box.get("faceIdDateDay") ?? "1".toString());


    box.get("faceId").toString() == "1"
        ? {
      if (myTime.month - month == 0)
        {
          if (myTime.day - day <= 30)
            {
              box.put("faceIdQolganKun",
                  (30 - (myTime.day - day).abs()).toString())
            }
          else
            {
              box.put("faceId", "0"),
              box.put("faceIdDateMonth", "0"),
              box.put("faceIdDateDay", "0"),
              box.put("faceIdQolganKun", "0")
            }
        }
      else if (myTime.month - month == 1)
        {
          if (monthDayCount[month] -
              myTime.day -
              (monthDayCount[month] - day) >
              0)
            {
              box.put("faceId", "1"),
              // box.put("faceIdDateMonth", "0"),
              // box.put("faceIdDateDay", "0"),
              box.put(
                  "faceIdQolganKun",
                  (monthDayCount[month] -
                      myTime.day -
                      (monthDayCount[month] - day))
                      .toString())
            }
          else
            {
              box.put("faceId", "0"),
              box.put("faceIdDateMonth", "0"),
              box.put("faceIdDateDay", "0"),
              box.put("faceIdQolganKun", "0")
            }
        }
      else
        {
          box.put("faceId", "0"),
          box.put("faceIdDateMonth", "0"),
          box.put("faceIdDateDay", "0"),
          box.put("faceIdQolganKun", "0")
        }

      // else{
      //   box.put("faceId", "0"),
      //   box.put("faceIdDateMonth", "0"),
      //   box.put("faceIdDateDay", "0"),
      //   box.put("faceIdQolganKun", "0")
      // }
    }
        : {};
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerProfile,
      child: Consumer<ProviderProfile>(
        builder: (context, value, child) => Scaffold(
            appBar: appBarProfile(
                context: context, providerProfile: providerProfile),
            backgroundColor: MyColors.appColorWhite(),
            body: 
            providerProfile.boolGetProfileData ?
            SafeArea(
                child: box.get("token").toString().length > 30
                    ? RefreshIndicator(
                  onRefresh: (){
                    return getProfileInfo();
                  },
                      child: ListView(
                        children: [
                          bodyProfile(

                  function: widget.myFunction,
                              context: context, providerProfile: providerProfile,
                functions: getProfileInfo
                ),
                        ],
                      ),
                    )
                    : bodyNoProfileInfo(
                        context: context, )):MyWidgets.loaderDownload(context: context)
                
        ),
      ),
    );
  }
}
