import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/base_text_widget.dart';

AppBar buildSettingsAppbar() {
  return AppBar(
    title: Center(
        child: reusableText(
      'Settings',
    )),
  );
}

Widget buildSettingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirm Logout'),
              content: Text('Confirm Logout'),
              actions: [
                TextButton(
                  onPressed: () {
                    // Navigate to login page or handle logout logic
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: func,
                  child: Text('Confirm'),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/icons/Logout.png'))),
    ),
  );
}

Widget buildUi() {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Lottie.asset('assets/animation/animation3.json')),
  );
}

Widget celebration() {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Lottie.asset('assets/animation/animation2.json')),
  );
}
