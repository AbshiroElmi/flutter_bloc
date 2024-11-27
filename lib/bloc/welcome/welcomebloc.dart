

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/welcome/welcomeEvents.dart';
import 'package:ulearning/bloc/welcome/welcomeState.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeSate> {
  WelcomeBloc():super(WelcomeSate()){
    on<WelcomeEvent>((event, emit) {
     emit(WelcomeSate(page:state.page));
    },);
  }
  
}