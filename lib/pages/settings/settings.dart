import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ulearning/bloc/app/appBloc.dart';
import 'package:ulearning/bloc/app/appEvent.dart';
import 'package:ulearning/bloc/increment_decrement_bloc/increment_decrement_bloc.dart';
import 'package:ulearning/bloc/increment_decrement_bloc/increment_decrement_event.dart';
import 'package:ulearning/bloc/settings/seetingState.dart';
import 'package:ulearning/bloc/settings/settingBloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/value/constant.dart';
import 'package:ulearning/global/global.dart';
import 'package:ulearning/pages/widget/settings_widget.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  bool showCelebration = false;

  Future<void> removeUserData() async {
    setState(() {
      showCelebration = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      showCelebration = false;
    });

    context.read<Application_Bloc>().add(TriggerAppEvent(0));

    Global.storeageService.removeToken(AppConstant.STORAGE_USER_TOKEN_KEY);

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildSettingsAppbar(),
        body: Container(
          // padding: EdgeInsets.only(top: 290),
          child: Column(
            children: [
              buildSettingsButton(context, removeUserData),
              showCelebration == true ? celebration() : buildUi(),
            ],
          ),
        ),
      );
    });
  }
}
