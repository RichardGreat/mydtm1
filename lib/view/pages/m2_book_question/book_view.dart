
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

class BookView extends StatefulWidget {
 final String linkBook;
 final String bookName;

 const BookView({super.key, required this.linkBook, required this.bookName});

  @override
  State<BookView> createState() => _CertificateViewState();
}

class _CertificateViewState extends State<BookView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: MyWidgets.robotoFontText(text: widget.bookName.toString(), textSize: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        elevation: 0,

      ),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child:
              const PDF(
                autoSpacing: false,
                fitEachPage: true,
                enableSwipe: true,
                fitPolicy: FitPolicy.BOTH,
              ).fromUrl(
                  widget.linkBook,
                placeholder: (progress) => Container(
                  color: Colors.white,
                  child: Center(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CupertinoActivityIndicator(),
                      Text('$progress %'),
                    ],
                  )),
                ),
              )

          )),
    );
  }
}
