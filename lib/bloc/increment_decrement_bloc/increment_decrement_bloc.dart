
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/increment_decrement_bloc/increment_decrement_event.dart';
import 'package:ulearning/bloc/increment_decrement_bloc/increment_decrement_state.dart';

class AppBlocs extends Bloc<AppEvent,AppState>{
  AppBlocs() : super(InitState()){
    on<Increment>((event, emit){
  emit(AppState(counter: state.counter+1));
    });
    
      on<Decrement>((event, emit){
  emit(AppState(counter: state.counter > 0 ? state.counter-1 :state.counter));
    });
  }
}