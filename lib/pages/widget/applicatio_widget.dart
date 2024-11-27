import 'package:flutter/material.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/home.dart';
import 'package:ulearning/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    Home(),
    Center(child: Text('Search')),
    Center(child: Text('Courses')),
    Center(child: Text('Chat')),
    Profile()
  ];

  return widget[index];
}

var bottonTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 23,
      height: 25,
      child: Image.asset('assets/icons/home.png'),
    ),
    label: 'Home',
    activeIcon: SizedBox(
        width: 23,
        height: 25,
        child: Image.asset(
          'assets/icons/home.png',
          color: AppColors.primaryElement,
        )),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 23,
      height: 25,
      child: Image.asset('assets/icons/search.png'),
    ),
    label: 'Search',
    activeIcon: SizedBox(
      width: 23,
      height: 25,
      child: Image.asset(
        'assets/icons/search.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 23,
      height: 25,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    label: 'Course',
    activeIcon: SizedBox(
      width: 23,
      height: 25,
      child: Image.asset(
        'assets/icons/play-circle1.png',
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 23,
      height: 23,
      child: Image.asset('assets/icons/message-circle.png'),
    ),
    activeIcon: SizedBox(
        width: 23,
        height: 23,
        child: Image.asset(
          'assets/icons/message-circle.png',
          color: AppColors.primaryElement,
        )),
    label: 'chat',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 23,
      height: 23,
      child: Image.asset('assets/icons/person2.png'),
    ),
    activeIcon: SizedBox(
        width: 23,
        height: 23,
        child: Image.asset(
          'assets/icons/person2.png',
          color: AppColors.primaryElement,
        )),
    label: 'Profile',
  ),
];
