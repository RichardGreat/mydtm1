import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m5_xabarlar/one_page_news/one_news.dart';
import 'package:mydtm/view/pages/m5_xabarlar/provider_news.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class MainMessages extends StatefulWidget {
  const MainMessages({Key? key}) : super(key: key);

  @override
  State<MainMessages> createState() => _MainMessagesState();
}

class _MainMessagesState extends State<MainMessages> {
  ProviderDtmNews providerDtmNews = ProviderDtmNews();

  @override
  initState() {
    getDtmNews();
    super.initState();
  }

  Future getDtmNews() async {
    await providerDtmNews.getAllDtmNews();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerDtmNews,
      child: Consumer<ProviderDtmNews>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: MyColors.appColorWhite(),
              elevation: 0,
              title: MyWidgets.robotoFontText(
                  text: "news".tr(),
                  textSize: 24,
                  textFontWeight: FontWeight.w500),
            ),
            body: providerDtmNews.boolDtmNews
                ? RefreshIndicator(
              onRefresh: (){
                return getDtmNews();
              },
                  child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: providerDtmNews.modelDtmNews2.length,
                            itemBuilder: (context, index) => Container(
                                margin: const EdgeInsets.only(
                                    right: 4, left: 5, bottom: 3, top: 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: MyColors.appColorWhite(),
                                    boxShadow: [
                                      BoxShadow(
                                          color: MyColors.appColorGrey400(),
                                          spreadRadius: 1,
                                          blurRadius: 1)
                                    ]),
                                child: ListTile(
                                  onTap: () {

                                    showModalBottomSheet<void>(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                                        barrierColor: Colors.black.withOpacity(0.2),
                                        context: context,
                                        enableDrag: true,
                                        isScrollControlled: true,
                                        builder: (_) {
                                          return Container(
                                              margin:const EdgeInsets.all(10),
                                              height: MediaQuery.of(context).size.height * 0.7,
                                              child:  NewsSee(
                                                  id: providerDtmNews
                                                      .modelDtmNews2[index].id
                                                      .toString(),
                                                  date: providerDtmNews
                                                      .modelDtmNews2[index].createdDate
                                                      .toString(),
                                                  titleName: providerDtmNews
                                                      .modelDtmNews2[index].title
                                                      .toString(),
                                                  imgUrl: providerDtmNews
                                                      .modelDtmNews2[index].imageUrl
                                                      .toString(),
                                                  providerDtmNews: providerDtmNews));
                                        });
                                    // pushNewScreen(context,
                                    //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                    //     screen:);
                                  },
                                  leading: CachedNetworkImage(
                                    height: 80,
                                    width: 100,
                                    fit: BoxFit.fill,
                                    imageUrl: providerDtmNews
                                        .modelDtmNews2[index].imageUrl,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  title: Text(
                                      providerDtmNews.modelDtmNews2[index].title
                                          .toString(),
                                      maxLines: 3),
                                  trailing: Text(providerDtmNews
                                      .modelDtmNews2[index].createdDate
                                      .toString()),
                                ))),
                      ),
                    ),
                )
                : MyWidgets.loaderDownload(context: context)),
      ),
    );
  }
}
