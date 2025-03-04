// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
// ignore_for_file: sized_box_for_whitespace
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/features/create_and_join_feature/ui/create_and_join_page.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/password_textfield.dart';
import 'package:osscam_app2/customs/row_login_or_signup.dart';
import 'package:osscam_app2/customs/row_remember_me.dart';
import 'package:osscam_app2/customs/textfield.dart';
import 'package:osscam_app2/features/login_feature/bloc/login_bloc.dart';
import 'package:osscam_app2/features/login_feature/model/login_model.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:osscam_app2/features/signup_feature/ui/signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 288,
                height: 360,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GREY,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 64),
                      CustomTextField(
                        title: "Email",
                        controller: emailController,
                      ),
                      SizedBox(height: 16),
                      CustomPasswordTexField(
                        passwordController: passwordController,
                      ),
                      SizedBox(height: 64),
                      CustomRowRememberMe(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -90,
                child: Container(
                  width: 140,
                  height: 140,
                  child: ClipRRect(
                    child: Image.asset("assets/image/osscam_icon.png"),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          SizedBox(height: 48),
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Login success"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAndJoinPage()),
                );
              } else if (state is LoginFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is LoginLoadingState
                  ? Center(child: CircularProgressIndicator.adaptive())
                  : CustomElevatedButton(
                    title: "Login",
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoggingEvent(
                          email: emailController.text,
                          pasword: passwordController.text,
                        ),
                      );
                    },
                  );
            },
          ),
          SizedBox(height: 10),
          CustomRowLognOrSignup(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            title: "Sign Up",
          ),
        ],
      ),
    );
  }
}
