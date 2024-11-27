import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/resigter/register_states.dart';
import 'package:ulearning/bloc/resigter/resgister_events.dart';

class RegisterBloc extends Bloc<RegisterEvent , RegisterState>{
  RegisterBloc() : super(RegisterState()){
    on<UsernameEvent>(_userNameEvent);
    on<Email_Event>(_emailNameEvent);
    on<Password_Event>(_passEvent);
    on<RePassword_Event>(_rePassEvent);
  }

  void _userNameEvent(UsernameEvent event, Emitter<RegisterState>emit){
    emit(state.copywith(userName: event.username));
    print("---------${event.username}");
  }
    void _emailNameEvent(Email_Event event, Emitter<RegisterState>emit){
    emit(state.copywith(email: event.email));
        print("---------${event.email}");
  } 
   void _passEvent(Password_Event event, Emitter<RegisterState>emit){
    emit(state.copywith(password: event.password));
      print("---------${event.password}");
  } 
  
  void _rePassEvent(RePassword_Event event, Emitter<RegisterState>emit){
    emit(state.copywith(rePassword: event.rePassword));
      print("---------${event.rePassword}");
  }
}