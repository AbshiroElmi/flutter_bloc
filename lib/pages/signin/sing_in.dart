import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/signin/sigin_bloc.dart';
import 'package:ulearning/bloc/signin/signEvent.dart';
import 'package:ulearning/bloc/signin/signIn_state.dart';
import 'package:ulearning/controller/sign_controller.dart';
import 'package:ulearning/pages/widget/common_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignBloc, SignInState>(
      builder: (context, state) {
        return Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppbar('Login'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildthirdLogin(context),
                    Center(
                        child:
                            reuseAbleText('Or use your email account login')),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText('Email'),
                          SizedBox(height: 5),
                          buildtextfeild(
                              'Enter your email address', 'email', 'user',
                              (value) {
                            context.read<SignBloc>().add(EmailEvent(value));
                          }),
                          reuseAbleText('Password'),
                          SizedBox(height: 5),
                          buildtextfeild(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context.read<SignBloc>().add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    Forgetpassword(),
                     SizedBox(height: 70),
                    buiLoginButton('Log In', 'login', () {
                    SignController(context:context).handlesigIn("email");
                    }),
                    buiLoginButton('Sign Up', 'register', () {
                      Navigator.of(context).pushNamed('/register');
                       ;
                    }),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
