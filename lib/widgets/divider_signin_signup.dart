import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DividerSigninSignup extends StatelessWidget {
  const DividerSigninSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10),
            child: const Divider(
              thickness: 1,
              color: Color(0xffB8B8B8),
              height: 24,
            )),
      ),
      Text(
        AppLocalizations.of(context)!.or,
        style: TextStyle(color: Color(0xffB8B8B8)),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10.0),
            child: const Divider(
              thickness: 1,
              color: Color(0xffB8B8B8),
              height: 24,
            )),
      ),
    ]);
  }
}
