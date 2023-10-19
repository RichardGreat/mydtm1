import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/pages/m2_book_question/controller_book_question.dart';
import 'package:mydtm/view/pages/m3_home/service_page/service_page.dart';
import 'package:mydtm/view/pages/m3_home/webview_window/webv_window.dart';

import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

class BookQuestions extends StatefulWidget {
  const BookQuestions({super.key});

  @override
  State<BookQuestions> createState() => _BookQuestionsState();
}

class _BookQuestionsState extends State<BookQuestions> {
  ControllerBookQuestion _controllerBookQuestion = ControllerBookQuestion();

  @override
  void initState() {
    _controllerBookQuestion.getDataQuestionBook();
    super.initState();
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
            title: Text("Namunaviy test topshiriqlari", style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            elevation: 0,
          ),
          body: _controllerBookQuestion.boolGetDataQuestion?  Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: GridView.builder(
              itemCount: _controllerBookQuestion.listModelSubjectGet.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    // print(myList[index].id.toString());
                    // if (myList[index].id.toString() == "88888888") {
                    //   pushNewScreen(context,
                    //       withNavBar: false,
                    //       screen: CertificateView(
                    //           linkCert: myList[index].link));
                    // }
                    // if (myList[index].id.toString().length > 5 &&
                    //     myList[index].id.toString().length < 9) {

                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder:
                                (context) =>
                                    WebViewWindow(
                                      modelServiceMainList: _controllerBookQuestion.listModelSubjectGet[index].pdfLink,
                        )));
                    // } else {
                      // pushNewScreen(
                      //   context,
                      //   screen: ShowCaseWidget(
                      //     builder: Builder(
                      //         builder: (context) => ShowCaseWidget(
                      //           builder: Builder(
                      //             builder: (context) => ServicePage(
                      //                 serviceMainList: _controllerBookQuestion.listModelSubjectGet[index]),
                      //           ),
                      //         )),
                      //   ),
                      //   withNavBar: true,
                      //   // OPTIONAL VALUE. True by default.
                      //   pageTransitionAnimation:
                      //   PageTransitionAnimation.cupertino,
                      // );
                    // }
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
                        _controllerBookQuestion.listModelSubjectGet[index].subjectImgLink.toString().length > 5 ?
                        Padding(
                           padding:const EdgeInsets.only(top: 5),
                          child: CachedNetworkImage(
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              imageUrl: _controllerBookQuestion.listModelSubjectGet[index].subjectImgLink,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                              const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                                  Image.asset("assets/images/uzbmb.png")),
                        )
                            :
                        const Icon(Icons.add,
                            size: 40, color: Colors.teal),

                        const SizedBox(height: 10,),

                        SizedBox(
                          child: Text(
                            box.get("language") == "1"
                                ? _controllerBookQuestion.listModelSubjectGet[index].subjectName
                                : box.get("language") == "2"
                                ? _controllerBookQuestion.listModelSubjectGet[index].subjectName
                                : _controllerBookQuestion.listModelSubjectGet[index].subjectName,
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
                  maxCrossAxisExtent: 170,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 6),
            ),
          )
          :const Center(child: CupertinoActivityIndicator(),)
          ,

        ),
      ),
    );
  }
}
