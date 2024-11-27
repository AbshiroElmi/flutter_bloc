import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/app/appBloc.dart';
import 'package:ulearning/bloc/app/appEvent.dart';
import 'package:ulearning/bloc/app/appState.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/applicatio_widget.dart';

class AppLication extends StatefulWidget {
  const AppLication({super.key});

  @override
  State<AppLication> createState() => _AppLicationState();
}

class _AppLicationState extends State<AppLication> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Application_Bloc, Application_State>(
      
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          body: buildPage(state.index),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: state.index,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedItemColor: AppColors.primaryElement,
            unselectedItemColor: AppColors.primaryFourElementText,
            onTap: (value) {
              setState(() {
                context.read<Application_Bloc>().add(TriggerAppEvent(value));
              });
            },
            items:bottonTabs
          ),
        )),
      );
    });
  }
}
