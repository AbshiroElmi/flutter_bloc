import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/signin/signEvent.dart';
import 'package:ulearning/bloc/signin/signIn_state.dart';

class SignBloc extends Bloc<SignEvent, SignInState> {
  SignBloc() : super(SignInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }


void _emailEvent (EmailEvent event,Emitter<SignInState> emit) {
    //  print('the email event ${event.email}');
     emit(state.copyWith(email: event.email));
}

void _passwordEvent (PasswordEvent event,Emitter<SignInState> emit){
    //  print('the password event ${event.password}');
   emit(state.copyWith(password: event.password));
}


}
