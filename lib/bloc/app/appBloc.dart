 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/app/appEvent.dart';
import 'package:ulearning/bloc/app/appState.dart';

class Application_Bloc extends Bloc<Application_Event ,Application_State>{
  Application_Bloc(): super(Application_State()){
    on<TriggerAppEvent>((event, emit){
      emit(Application_State(index: event.index));
    });
  }


}
