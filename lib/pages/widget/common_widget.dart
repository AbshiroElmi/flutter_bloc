import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/value/colors.dart';

AppBar buildAppbar(String type) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child:
          Container(height: 1.0, color: AppColors.primarySecondaryBackground),
    ),
    title: Center(
      child: Text(
       type,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildthirdLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40,
      bottom: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _reuseAbleicons('google'),
        SizedBox(
          width: 20,
        ),
        _reuseAbleicons('apple'),
        SizedBox(
          width: 20,
        ),
        _reuseAbleicons('facebook'),
      ],
    ),
  );
}

Widget _reuseAbleicons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reuseAbleText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.6),
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}

Widget buildtextfeild(String hintText, String textType, String iConName,
    void Function(String)? func) {
  return Container(
      width: 365,
      height: 50,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryFourElementText),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17),
            height: 20,
            width: 20,
            child: Image.asset('assets/icons/$iConName.png'),
          ),
          Container(
            width: 270,
            height: 50,
            padding: EdgeInsets.only(top: 15),
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  helperStyle:
                      TextStyle(color: AppColors.primarySecondaryElementText)),
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.primaryText),
              autocorrect: false,
              obscureText: textType == 'password' ? true : false,
            ),
          )
        ],
      ));
}

Widget Forgetpassword() {
  return Container(
    margin: EdgeInsets.only(left: 20, top: 5),
    width: 260,
    height: 44,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forget password',
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12),
      ),
    ),
  );
}

Widget buiLoginButton(
    String buttonName, String bottonType, void Function() ? func) {
  return GestureDetector(
    onTap:  func,
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(
          left: 25, right: 25, top: bottonType == 'login' ? 40 : 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bottonType == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          border: Border.all(
            color: bottonType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourElementText,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: bottonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
