
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/resigter/register_bloc.dart';
import 'package:ulearning/common/widget/flutertoast.dart';

class Register_Controller {
  final BuildContext context;
  Register_Controller({required this.context});

  Future<void> handle_register() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'user name cant empty');
    }
    if (email.isEmpty) {
      toastInfo(msg: 'email cant empty');
    }
    if (password.isEmpty) {
      toastInfo(msg: 'password cant empty');
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'password confirm is wrong ');
    }
try{

 final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
 if(credential.user != null){
   await credential.user?.sendEmailVerification();
   await credential.user?.updateDisplayName(userName);
   toastInfo(msg: 'An email has been sendt to your registed email activate it please chech your email inbox and click link');
   Navigator.of(context).pop();
 }

}on FirebaseAuthException catch(e){
  if(e.code == 'email-already-in-use'){
    toastInfo(msg: 'email already in use');
  }
  if(e.code == 'weak-password'){
    toastInfo(msg: 'password is weak');
  }
  if(e.code == 'invalid-email'){
    toastInfo(msg: 'invalid email');
  }
  if(e.code == 'user-not-found'){
    toastInfo(msg: 'user not found');
  }
  if(e.code == 'wrong-password'){
    toastInfo(msg: 'wrong password');
  }
 
}

 catch (e){}



  }
}
