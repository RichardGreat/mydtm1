import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m3_home/provider_main_home.dart';
import 'package:mydtm/view/pages/m3_home/serch_main.dart';
import 'package:provider/provider.dart';

class CheckInfoCertificate extends StatefulWidget {
  const CheckInfoCertificate({super.key});

  @override
  State<CheckInfoCertificate> createState() => _CheckInfoCertificateState();
}

class _CheckInfoCertificateState extends State<CheckInfoCertificate>  with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {

    controller =
        AnimationController(
            duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    controller.forward();
    getServiceList();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  var box = Hive.box("online");

  Future getServiceList() async {
    Future.delayed(Duration.zero);
    await providerMainHome.getDateService(context: context);
  }

  ProviderMainHome providerMainHome = ProviderMainHome();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerMainHome,
      child: Consumer<ProviderMainHome>(
        builder: (context, value, child) => providerMainHome.boolParseData
            ? !providerMainHome.boolErrorHandle
                ? Scaffold(
                    appBar: searchMain(
                        context: context, providerMainHome: providerMainHome),
                    body:

                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              // X, Y - Origin (0, 0) is in the upper left corner.
                              begin:  Offset(box.get("animationWindowValue")??1, 0),
                              end:const Offset(0, 0),
                            ).animate(controller),
                            child:  SafeArea(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          mainSearchBottomSheet(
                                              context: context,
                                              providerMainHome: providerMainHome);
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.search_rounded,
                                              color: Colors.grey.shade400,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "searchService".tr(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            // PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition(), page: null);

                            //
                          );
                        })


                  )
                :  Scaffold(
                    body:
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return SlideTransition(
                              position: Tween<Offset>(
                                // X, Y - Origin (0, 0) is in the upper left corner.
                                begin: const Offset(1, 0),
                                end:const Offset(0, 0),
                              ).animate(controller),
                              child: const Center(child: CupertinoActivityIndicator()),
                            // PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition(), page: null);

                            //
                          );
                        })

                  )
            :  Scaffold(
                body:
                AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          // X, Y - Origin (0, 0) is in the upper left corner.
                          begin:  Offset(box.get("animationWindowValue")??1, 0),
                          end:const Offset(0, 0),
                        ).animate(controller),
                        child: const Center(child: CupertinoActivityIndicator()),
                        // PageAnimationTransition(child: PageTwo(), pageAnimationType: LeftToRightFadedTransition(), page: null);

                        //
                      );
                    })

              ),
      ),
    );
  }
}
