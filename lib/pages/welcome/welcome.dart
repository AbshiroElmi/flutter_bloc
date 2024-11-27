import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/bloc/welcome/welcomeEvents.dart';
import 'package:ulearning/bloc/welcome/welcomeState.dart';
import 'package:ulearning/bloc/welcome/welcomebloc.dart';
import 'package:ulearning/common/value/constant.dart';
import 'package:ulearning/global/global.dart';
import 'package:ulearning/pages/increment_decrementPage.dart';

class Welcome_page extends StatefulWidget {
  const Welcome_page({super.key});

  @override
  State<Welcome_page> createState() => _Welcome_pageState();
}

class _Welcome_pageState extends State<Welcome_page> {
  PageController _pageController = PageController(  initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeSate>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34, left: 20),
            width: 375.w,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    page(
                        1,
                        context,
                        "First see learning",
                        "First thing you need to know about BLoC, it’s a state management ",
                        "Next",
                        "assets/images/reading.png"),
                    page(
                        2,
                        context,
                        "Always remember the state",
                        "First thing you need to know about BLoC, it’s a state management ",
                        "Know more",
                        "assets/images/boy.png"),
                    page(
                        3,
                        context,
                        "Connect with everyone",
                        "First thing you need to know about BLoC, it’s a state management ",
                        "Get Started",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                  bottom: 90,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: state.page,
                    decorator: DotsDecorator(
                        activeColor:AppColors.primaryElement,
                        color:AppColors.primaryThreeElementText,
                        size: Size.square(8.0),
                        activeSize: Size(15.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }

  Widget page(int index, BuildContext context, String title, String subtile,
      String ButtomName, String imagepath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child:Image.asset(fit: BoxFit.cover,imagepath)
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primaryText
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 10),
          child: Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color:AppColors.primarySecondaryElementText,
                fontWeight: FontWeight.normal,
              ),
              subtile),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
           _pageController.animateToPage(
            index    ,      
            duration: (Duration(milliseconds: 600)), 
            curve: Curves.decelerate
            );
            } else {
      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage()));
        Global.storeageService.setBool(AppConstant.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
    
         Navigator.pushNamedAndRemoveUntil(context, '/sing_in' ,(route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 30, right: 30),
            height: 50,
            width: 325,
            decoration: BoxDecoration(
              color:AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    offset: Offset(0.0, 2),
                    blurRadius: 2)
              ],
            ),
            child: Center(
              child: Text(
                ButtomName,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
