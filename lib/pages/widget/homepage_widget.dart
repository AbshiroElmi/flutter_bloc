import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/home/homeBloc.dart';
import 'package:ulearning/bloc/home/homeState.dart';
import 'package:ulearning/bloc/home/home_event.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/base_text_widget.dart';

AppBar build_AppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(right: 7, left: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 15,
            height: 15,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/person.png'))),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homeText(String text,
    {Color? color = AppColors.primaryText, double top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top),
    child: Text(
      text,
      style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchview() {
  return Row(
    children: [
      Container(
        width: 280,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17),
              height: 16,
              width: 16,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240,
              height: 40,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: 'search your course',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    helperStyle: TextStyle(
                        color: AppColors.primarySecondaryElementText)),
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: AppColors.primaryText),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 5,
      ),
      GestureDetector(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: AppColors.primaryElement),
            color: AppColors.primaryElement,
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

Widget sliderview(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20),
        width: 325,
        height: 160,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(HomeDots(value));
          },
          children: [
            Container(
              padding: EdgeInsets.only(right: 5, left: 3),
              child: _sliderContainer(path: 'assets/icons/art.png'),
            ),
            Container(
              padding: EdgeInsets.only(right: 5,left: 3),
              child: _sliderContainer(path: 'assets/icons/Image_1.png'),
            ),
            Container(
              padding: EdgeInsets.only(right: 5,left: 3),
              child: _sliderContainer(path: 'assets/icons/Image_2.png'),
            ),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: Size.square(5),
              activeSize: Size(17, 5),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      )
    ],
  );
}

_sliderContainer({String path = 'assets/icons/art.png'}) {
  return Container(
    width: 325,
    height: 160,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryBackground,
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(path))),
  );
}

Widget menuview() {
  return Column(
    children: [
      Container(
          margin: EdgeInsets.only(top: 15),
          width: 325,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              reusableText('Choose your course'),
              GestureDetector(
                  child: reusableText('See all',
                      color: AppColors.primaryThreeElementText, fontSize: 14)),
            ],
          )),
      Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            _reusablemenuText('All'),
            _reusablemenuText('Popular',
                textcolor: AppColors.primaryThreeElementText,
                backgroundColor: Colors.white),
            _reusablemenuText('Newest',
                textcolor: AppColors.primaryThreeElementText,
                backgroundColor: Colors.white)
          ],
        ),
      )
    ],
  );
}

Widget _reusablemenuText(String menutext,
    {Color textcolor = AppColors.primaryElementText,
    Color backgroundColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(7),
            // border: Border.all(color: AppColors.primaryElement),
          ),
          child: reusableText(menutext,
              color: textcolor, fontWeight: FontWeight.normal, fontSize: 14),
        )
      ],
    ),
  );
}

Widget courseGrid() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/icons/Image_1.png'))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 12),
          child: Text(
            'Best course for it',
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryElementText,
                fontSize: 11),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          margin: EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            'Flutter course',
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryFourElementText,
                fontSize: 11),
          ),
        )
      ],
    ),
  );
}
