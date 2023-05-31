import 'package:flutter/material.dart';
import 'package:beatSeller/screens/root_app.dart';
import 'package:beatSeller/theme/color.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            "Please check your email and proceed to checkout to receive the beat you ordered.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: primary, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () {
          Navigator.popUntil(context, ModalRoute.withName(RootApp.id));
        },
        child: Container(
            height: 40,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Back to home",
              style: TextStyle(
                  color: textBoxColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
