import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/app/appBloc.dart';
import 'package:ulearning/bloc/resigter/register_bloc.dart';
import 'package:ulearning/bloc/settings/settingBloc.dart';
import 'package:ulearning/bloc/signin/sigin_bloc.dart';
import 'package:ulearning/bloc/home/homeBloc.dart';
import 'package:ulearning/bloc/welcome/welcomebloc.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/global/global.dart';
import 'package:ulearning/home.dart';
import 'package:ulearning/pages/home/application.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/settings/settings.dart';
import 'package:ulearning/pages/signin/sing_in.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: Welcome_page(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: SignIn(),
          bloc: BlocProvider(create: (_) => SignBloc())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBloc())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: AppLication(),
          bloc: BlocProvider(create: (_) => Application_Bloc())),
      PageEntity(
          route: AppRoutes.HOME,
          page: Home(),
          bloc: BlocProvider(create: (_) => HomeBloc())),
      PageEntity(
          route: AppRoutes.SETTINGS,
          page: Setting_page(),
          bloc: BlocProvider(create: (_) => SettingBloc())),
    ];
  }

//return all blocProviders

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
  // static List<BlocProvider<dynamic>> allBlocProviders(BuildContext context) {
  //   return routes()
  //       .where(
  //           (page) => page.bloc != null) // Ensure only non-null blocs are added
  //       .map((page) =>
  //           page.bloc as BlocProvider<dynamic>) // Cast to BlocProvider
  //       .toList();
  // }

//model covers the entire screen aswe click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
   
        bool devicefirstpen = Global.storeageService.getDeviceFirstopen();
        if (result.first.route == AppRoutes.INITIAL && devicefirstpen) {
          bool isLogoedin = Global.storeageService.getIslogedin();
          if (isLogoedin) {
            return MaterialPageRoute(
                builder: (_) => AppLication(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print('invalid route name${settings.name}');
    return MaterialPageRoute(builder: (_) => SignIn());
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
