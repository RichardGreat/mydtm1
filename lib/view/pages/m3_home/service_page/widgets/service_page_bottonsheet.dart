import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/m3_home/service_page/provider_service_page.dart';
import 'package:mydtm/view/widgets/app_widget/app_widgets.dart';

String a =
    "My Wonderful Family I live in a house near the mountains. I have two brothers and one sister, and I was born last. My father teaches mathematics, and my mother is a nurse at a big hospital. My brothers are very smart and work hard in school. My sister is a nervous girl, but she is very kind. My grandmother also lives with us. She came from Italy when I was two years old. She has grown old, but she is still very strong. She cooks the best food! My family is very important to me. We do lots of things together. My brothers and I like to go on long walks in the mountains. My sister likes to cook with my grandmother. On the weekends we all play board games together. We laugh and always have a good time. I love my family very much.";

serviceSheetBottomSheet(
    {required BuildContext context,
    required ProviderServicePage providerServicePage}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            margin:const  EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyWidgets.robotoFontText(text: "aboutService".tr()),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close))
                  ],
                ),
                Text(a),
              ],
            ),
          ),
        );
      });
}
