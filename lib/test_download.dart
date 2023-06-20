import 'package:easy_localization/easy_localization.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mydtm/data/internet_connections/main_url.dart';

class TestDownload extends StatefulWidget {
  const TestDownload({Key? key}) : super(key: key);

  @override
  _TestDownloadState createState() => _TestDownloadState();
}
DateTime now = DateTime.now();
var box = Hive.box("online");
getData() async{

  // DateTime date =  DateTime(now.year, now.month, now.day);
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  try {
    await FileSaver.instance.saveFile(
        name: "bmba_${DateFormat('yyyy-MM-dd – kk:mm').format(now)}.pdf",
        link: LinkDetails(link: "https://docviewer.yandex.uz/view/0/?*=beVY5yz7Adpsz6lid4AHc11k0i17InVybCI6Imh0dHBzOi8vMS5lZHViaXNoLmtnL3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDIyLzAxLzVrbC5hbmdsaXlza2l5LXlhenlrLWFiZHlzaGV2YS1pLWRyLjIwMTcucGRmIiwidGl0bGUiOiI1a2wuYW5nbGl5c2tpeS15YXp5ay1hYmR5c2hldmEtaS1kci4yMDE3LnBkZiIsIm5vaWZyYW1lIjp0cnVlLCJ1aWQiOiIwIiwidHMiOjE2ODcyNDMxMDA4NDYsInl1IjoiNDMxOTg3MDc5MTY4MzI5MTkxMyIsInNlcnBQYXJhbXMiOiJ0bT0xNjg3MjQzMDk0JnRsZD11eiZsYW5nPWVuJm5hbWU9NWtsLmFuZ2xpeXNraXkteWF6eWstYWJkeXNoZXZhLWktZHIuMjAxNy5wZGYmdGV4dD1ib29rK2VuZ2xpc2grNSslRDAlQkElRDAlQkIlRDAlQjAlRDElODElRDElODErcGRmJnVybD1odHRwcyUzQS8vMS5lZHViaXNoLmtnL3dwLWNvbnRlbnQvdXBsb2Fkcy9zaXRlcy8xMS8yMDIyLzAxLzVrbC5hbmdsaXlza2l5LXlhenlrLWFiZHlzaGV2YS1pLWRyLjIwMTcucGRmJmxyPTEwMzM1Jm1pbWU9cGRmJmwxMG49cnUmc2lnbj03ZGJiNGMyNjUzODljNDZmYzZmYmUyYzUyMzQxNzM4NCZrZXlubz0wIn0%3D&amp;lang=en", headers: {MainUrl.mainUrlHeader: box.get("token")})
    );
    //   {
    //     required String name,
    // Uint8List? bytes,
    // File? file,
    // String? filePath,
    // LinkDetails? link,
    // String ext = "",
    // MimeType mimeType = MimeType.other}
    //    await downloadFiles(url: urls, fileName: fileName);
  } catch (e) {
    throw Exception(e.toString());
  }

}

class _TestDownloadState extends State<TestDownload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: MaterialButton(onPressed: (){

        getData();}
      ,
        child: const Text("Download"),
      )),
    );
  }
}
