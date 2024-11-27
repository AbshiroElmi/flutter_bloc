import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/signin/sigin_bloc.dart';
import 'package:ulearning/common/value/constant.dart';
import 'package:ulearning/common/widget/flutertoast.dart';
import 'package:ulearning/global/global.dart';

class SignController {
  final BuildContext context;
  SignController({required this.context});

  Future<void> handlesigIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //email address
          toastInfo(msg: 'you need to enter email address',backgroundColor: Colors.red);
        }
        if (password.isEmpty) {
          //password
          toastInfo(msg: 'you need to enter password',backgroundColor: Colors.red);
        }

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: 'you dont exist');
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'you need to verify u email');

            ///
          }
          var user = credential.user;
          if (user != null) {
            print('user exist');
            Global.storeageService
                .setString(AppConstant.STORAGE_USER_TOKEN_KEY, '12345678');

            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            toastInfo(msg: 'you are not user of this app');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'user not found');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'password aan jirin aa laimatay lipx');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'invalid email');
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
