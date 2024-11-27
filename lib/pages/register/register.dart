import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/resigter/register_bloc.dart';
import 'package:ulearning/bloc/resigter/register_states.dart';
import 'package:ulearning/bloc/resigter/resgister_events.dart';
import 'package:ulearning/bloc/signin/sigin_bloc.dart';
import 'package:ulearning/bloc/signin/signEvent.dart';
import 'package:ulearning/controller/registerController.dart';
import 'package:ulearning/controller/sign_controller.dart';
import 'package:ulearning/pages/widget/common_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _HomeState();
}

class _HomeState extends State<Register> {
   @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc ,RegisterState>(builder: (context , state){
     return Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppbar('Sing Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                        child:
                            reuseAbleText('Enter your details below free singUp')),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reuseAbleText('User name'),
                          SizedBox(height: 5),
                          buildtextfeild(
                              'Enter your user name', 'name', 'user',
                              (value) {
                            context.read<RegisterBloc>().add(UsernameEvent(value));
                          }),  
                          reuseAbleText('Email'),
                          SizedBox(height: 5),
                          
                            buildtextfeild(
                              'Enter your email address', 'email', 'user',
                              (value) {
                            context.read<RegisterBloc>().add(Email_Event(value));
                          }),
                          reuseAbleText('Password'),
                          SizedBox(height: 5),
                          buildtextfeild(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context.read<RegisterBloc>().add(Password_Event (value));
                          }),
                              reuseAbleText('Confirm Password'),
                          SizedBox(height: 5),
                          buildtextfeild(
                              'Confirm Password', 'password', 'lock',
                              (value) {
                            context.read<RegisterBloc>().add(RePassword_Event(value));
                          }),
                        ],
                      ),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(left: 23,right: 23),
                     child: reuseAbleText('By creating an account you have to agree with our terms & conditions.'),
                   ),
                
                    buiLoginButton('SingUp', 'login', () {
                      // Navigator.of(context).pushNamed('register');
                      Register_Controller(context:context).handle_register();
                       ;
                    }),
                  ],
                ),
              ),
            ));
    });
  }
}