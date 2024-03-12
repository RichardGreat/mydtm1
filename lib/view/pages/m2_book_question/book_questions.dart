import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/data/model_parse/m3_home/model_main_list.dart';
import 'package:mydtm/view/pages/check_certificate/check_cert/certificate_view.dart';
import 'package:mydtm/view/pages/m2_book_question/book_view.dart';
import 'package:mydtm/view/pages/m2_book_question/controller_book_question.dart';
import 'package:mydtm/view/pages/m3_home/webview_window/webv_window.dart';
import 'package:provider/provider.dart';

class BookQuestions extends StatefulWidget {
  const BookQuestions({super.key});

  @override
  State<BookQuestions> createState() => _BookQuestionsState();
}

class _BookQuestionsState extends State<BookQuestions>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final ControllerBookQuestion _controllerBookQuestion =
      ControllerBookQuestion();

  @override
  initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    animation = Tween<double>(begin: 0, end: 600).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object's value.
        });
      });
    controller.forward();
    getData();
    super.initState();
  }

  late ServiceMainList serviceMainList;

  getData() async {
    try {
      _controllerBookQuestion.getDataQuestionBook();
    } catch (e) {
      log(e.toString());
    }
  }

  var box = Hive.box("online");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _controllerBookQuestion,
      child: Consumer<ControllerBookQuestion>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("standartTest".tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              centerTitle: true,
              elevation: 0,
            ),
            body: SlideTransition(
              position: Tween<Offset>(
                // X, Y - Origin (0, 0) is in the upper left corner.
                begin: Offset(box.get("animationWindowValue") ?? 1, 0),
                end: const Offset(0, 0),
              ).animate(controller),
              child: _controllerBookQuestion.boolGetDataQuestion
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: GridView.builder(
                        itemCount:
                            _controllerBookQuestion.listModelSubjectGet.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop();
                              // print(myList[index].id.toString());
                              // if (myList[index].id.toString() == "88888888") {
                              //   pushNewScreen(context,
                              //       withNavBar: false,
                              //       screen: CertificateView(
                              //           linkCert: myList[index].link));
                              // }
                              // if (myList[index].id.toString().length > 5 &&
                              //     myList[index].id.toString().length < 9) {
                              log(_controllerBookQuestion
                                  .listModelSubjectGet[index].pdfLink);
                              log(_controllerBookQuestion
                                  .listModelSubjectGet[index].pdfLink);
                              log(_controllerBookQuestion
                                  .listModelSubjectGet[index].pdfLink);
                              serviceMainList = ServiceMainList(
                                  id: "",
                                  serviceName: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  serviceText: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  serviceTextRu: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  serviceTextQQ: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  serviceNameRu: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  serviceNameQQ: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectName
                                      .toString(),
                                  status: true,
                                  mobilIcon: "",
                                  link: _controllerBookQuestion
                                      .listModelSubjectGet[index].pdfLink,
                                  icon: "",
                                  catId: "",
                                  cod: _controllerBookQuestion
                                      .listModelSubjectGet[index].subjectId,
                                  sortId: "",
                                  createdAt: "",
                                  updatedAt: "",
                                  deleted: "");

                              log(jsonEncode(serviceMainList));


                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => BookView(
                                           linkBook:
                                           _controllerBookQuestion
                                               .listModelSubjectGet[index].pdfLink,
                                        bookName:  _controllerBookQuestion
                                            .listModelSubjectGet[index].subjectName.toString()
                                          )));

                              // Navigator.push(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (context) => WebViewWindow(
                              //               modelServiceMainList:
                              //                   serviceMainList,
                              //             )));


                            },
                            child: Container(
                              width: 80,
                              height: 100,
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 2),
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.teal.withOpacity(0.3),
                                        blurRadius: 1,
                                        spreadRadius: 1)
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _controllerBookQuestion
                                              .listModelSubjectGet[index]
                                              .subjectImgLink
                                              .toString()
                                              .length >
                                          5
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: CachedNetworkImage(
                                              width: 60,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              imageUrl: _controllerBookQuestion
                                                  .listModelSubjectGet[index]
                                                  .subjectImgLink,
                                              progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                  const CupertinoActivityIndicator(),
                                              errorWidget: (context, url,
                                                      error) =>
                                                  Image.asset(
                                                      "assets/images/uzbmb.png")),
                                        )
                                      : const Icon(Icons.add,
                                          size: 40, color: Colors.teal),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      box.get("language") == "1"
                                          ? _controllerBookQuestion
                                              .listModelSubjectGet[index]
                                              .subjectName
                                          : box.get("language") == "2"
                                              ? _controllerBookQuestion
                                                  .listModelSubjectGet[index]
                                                  .subjectName
                                              : _controllerBookQuestion
                                                  .listModelSubjectGet[index]
                                                  .subjectName,
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto-Medium'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 179,
                                childAspectRatio: 1,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 6),
                      ),
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    ),
            )),
      ),
    );
  }
}
