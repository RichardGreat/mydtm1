import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/person_info/certificate/provider_certificate.dart';
import 'package:mydtm/view/pages/person_info/certificate/widgets/photo/image_edit.dart';


// Widget
changeAvatar(
    {required BuildContext context,
      required ProviderCertificate providerCertificate}) {

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enableDrag: true,
    builder: (context) => Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            )),
        height: 200,
        child: ChooseImagesAvatar(
            providerCertificate:
            providerCertificate)),
  );
  // return GestureDetector(
  //   onTap: () {
  //     // box.get("image") == null
  //     //     ?
  //     // showModalBottomSheet(
  //     //   context: context,
  //     //   shape: RoundedRectangleBorder(
  //     //     borderRadius: BorderRadius.circular(10),
  //     //   ),
  //     //   enableDrag: true,
  //     //   builder: (context) => Container(
  //     //       decoration:  BoxDecoration(
  //     //           color: MyColors.appColorWhite(),
  //     //           borderRadius: const BorderRadius.only(
  //     //             topRight: Radius.circular(5),
  //     //             topLeft: Radius.circular(5),
  //     //           )),
  //     //       height: 200,
  //     //       child: ChooseImagesAvatar(
  //     //           providerCertificate: providerCertificate)),
  //     // );
  //         // : providerCertificate.showImage(
  //         // context: context, providerCertificate: providerCertificate);
  //
  //   },
  //   child: Container(
  //       width: 100,
  //       height: 100,
  //       decoration: BoxDecoration(color: MyColors.appColorWhite()),
  //       padding: const EdgeInsets.fromLTRB(4, 0, 0, 4),
  //       child: Stack(
  //         children: [
  //           CircleAvatar(
  //             radius: 80,
  //             backgroundColor: MyColors.appColorWhite(),
  //             child: SizedBox.fromSize(
  //               size: const Size.fromRadius(80), // Image radius
  //               child: ClipOval(
  //                 child: providerCertificate.box.get("image") == null
  //                     ? Image.asset("assets/images/splash_picture.png")
  //                     : Image.memory(
  //
  //                     base64Decode(providerCertificate.box
  //                         .get("image")
  //                         .replaceAll("\n", "")),
  //
  //                     fit: BoxFit.cover),
  //               ),
  //             ),
  //           ),
  //           Align(
  //             child: Icon(
  //               Icons.add_a_photo,
  //               color: MyColors.appColorBackC4(),
  //             ),
  //             alignment: Alignment.bottomRight,
  //           )
  //         ],
  //       )),
  // );
}
