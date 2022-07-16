import 'package:flutter/material.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/body_new_edu_perevod/body_new_edu_perevod.dart';
import 'package:mydtm/view/perevod/pages/new_edu_perevod/provider_new_edu.dart';
import 'package:provider/provider.dart';

class NewEduPerevod extends StatefulWidget {
  const NewEduPerevod({Key? key}) : super(key: key);

  @override
  State<NewEduPerevod> createState() => _NewEduPerevodState();
}

class _NewEduPerevodState extends State<NewEduPerevod> {
  ProviderNewEduPerevod providerNewEduPerevod = ProviderNewEduPerevod();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => providerNewEduPerevod,
      child: Consumer<ProviderNewEduPerevod>(
        builder: (context, value, child) => Scaffold(
            body: bodyNewPerevod(
                context: context,
                providerNewEduPerevod: providerNewEduPerevod)),
      ),
    );
  }
}
