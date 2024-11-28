
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServce {
  GoogleSignIn signIn = GoogleSignIn();
  Future<void> signInWithGoogle(BuildContext context)async {
    try {
      var user = await signIn.signIn();
         if (user != null) { 
        Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
      }
    } catch (e) {}
  }
}