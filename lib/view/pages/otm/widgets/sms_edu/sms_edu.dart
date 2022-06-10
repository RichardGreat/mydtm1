import 'package:flutter/material.dart';
import 'package:mydtm/view/pages/otm/widgets/sms_edu/sms_provider.dart';
import 'package:mydtm/view/pages/otm/widgets/sms_edu/widget_sms_edu/body_sms_du.dart';
import 'package:provider/provider.dart';

class SmsEdu extends StatefulWidget {
  const SmsEdu({Key? key}) : super(key: key);

  @override
  State<SmsEdu> createState() => _SmsEduState();
}

class _SmsEduState extends State<SmsEdu> {
  ProviderSmsEdu providerSmsEdu = ProviderSmsEdu();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerSmsEdu,
      child: Consumer<ProviderSmsEdu>(
        builder: (context, value, child) => Scaffold(
          body: bodySmsEdu(context: context, providerSmsEdu: providerSmsEdu),
        ),
      ),
    );
  }
}
