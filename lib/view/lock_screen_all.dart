import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mydtm/view/widgets/colors/app_colors.dart';

class LockScreenAllWindow extends StatefulWidget {
  const LockScreenAllWindow({Key? key}) : super(key: key);

  @override
  State<LockScreenAllWindow> createState() => _LockScreenAllWindowState();
}

class _LockScreenAllWindowState extends State<LockScreenAllWindow> {
  @override
  initState() {
    getLockAllWindow();
    super.initState();

  }

  var box = Hive.box("online");

  Future getLockAllWindow()async{


    await Future.delayed(const Duration(milliseconds: 10)).then((value) {
      box.put("lockHasEnter", "1");

      screenLock(
        context: context,
        title: Text("Parol kiriting",
            style: TextStyle(color: MyColors.appColorBlack())),
        didConfirmed: (String a) {
          box.delete("lockHasEnter");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        correctString: box.get("lockScreen").toString(),
        confirmation: true,
        footer: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "DTM",
                style: TextStyle(
                    color: MyColors.appColorBlack(),
                    fontWeight: FontWeight.w500),
              )
            ]),
        canCancel: false,
        screenLockConfig: const ScreenLockConfig(
          backgroundColor: Colors.white,
        ),
        secretsConfig: SecretsConfig(
          spacing: 15, // or spacingRatio
          padding: const EdgeInsets.all(40),
          secretConfig: SecretConfig(
            borderColor: Colors.white,
            borderSize: 2.0,
            disabledColor: Colors.black,
            enabledColor: Colors.blue,
            height: 15,
            width: 15,
            build: (context, {required config, required enabled}) {
              return SizedBox(
                width: config.width,
                height: config.height,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: enabled ? config.enabledColor : config.disabledColor,
                    border: Border.all(
                      width: config.borderSize,
                      color: config.borderColor,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  width: config.width,
                  height: config.height,
                ),
              );
            },
          ),
        ),
        cancelButton: const Icon(Icons.close, color: Colors.black),
        deleteButton:
        const Icon(CupertinoIcons.delete_left_fill, color: Colors.black),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.appColorWhite(),
      body: SafeArea(child: Column()),
    );
  }
}
