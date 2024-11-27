import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/base_text_widget.dart';

AppBar buildProfileAppbar() {
  return AppBar(
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18,
            height: 12,
            child: Image.asset('assets/icons/menu.png'),
          ),
          reusableText('Profile'),
          SizedBox(
            width: 24,
            height: 24,
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/icons/more-vertical.png')),
          ),
        ],
      ),
    ),
  );
}

Widget buildProfileiconEditBotton() {
  return Container(
    child: Column(
      children: [
        Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 6),
            child: Image(
              width: 25,
              height: 25,
              image: AssetImage('assets/icons/edit_3.png'),
            ),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/icons/headpic.png'),
                  fit: BoxFit.cover,
                )))
      ],
    ),
  );
}

var imagesInfo = <String, String>{
  'settings': 'settings.png',
  'Payment Details': 'credit-card.png',
  'Achievement': 'award.png',
  'Love': 'heart(1).png',
  'Learning Reminder': 'cube.png',
};

Widget buildListview(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () {
                  if (imagesInfo.keys.elementAt(index) == 'settings') {
                    Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryElement),
                        child: Image.asset(
                            'assets/icons/${imagesInfo.values.elementAt(index)}'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${imagesInfo.keys.elementAt(index)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.primaryText),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}
