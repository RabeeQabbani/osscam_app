// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/password_textfield.dart';
import 'package:osscam_app2/customs/row_login_or_signup.dart';
import 'package:osscam_app2/customs/row_remember_me.dart';
import 'package:osscam_app2/customs/textfield.dart';
import 'package:osscam_app2/features/create_and_join_feature/ui/create_and_join_page.dart';
import 'package:osscam_app2/features/create_task_feature/ui/create_task_page.dart';
import 'package:osscam_app2/features/login_feature/ui/login_page.dart';
import 'package:osscam_app2/features/project_created_successfully_feature/ui/project_created_successfully_page.dart';
import 'package:osscam_app2/features/signup_feature/bloc/bloc/signup_bloc.dart';
import 'package:osscam_app2/features/signup_feature/model/signup_model.dart';
import 'package:osscam_app2/features/signup_feature/service/signup_service.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BLUE,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 288,
                height: 440,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GREY,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 48),
                        CustomTextField(
                          controller: firstNameController,
                          title: "FirstName",
                        ),
                        SizedBox(height: 16),
                        CustomTextField(
                          controller: lastNameController,
                          title: "LastName",
                        ),
                        SizedBox(height: 16),

                        CustomTextField(
                          controller: emailController,
                          title: "Email",
                        ),
                        SizedBox(height: 16),
                        CustomPasswordTexField(
                          passwordController: passwordController,
                        ),
                        SizedBox(height: 8),
                        CustomRowRememberMe(),
                      ],
                    ),
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
          BlocConsumer<SignupBloc, SignupState>(
            builder: (context, state) {
              return state is SignupLoadingState
                  ? Center(child: CircularProgressIndicator())
                  : CustomElevatedButton(
                    title: "Sign Up",
                    onPressed: () {
                      BlocProvider.of<SignupBloc>(context).add(
                        RegisterEvent(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  );
            },
            listener: (context, state) {
              if (state is SignupSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("sign up success"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAndJoinPage()),
                );
              } else if (state is SignupFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
          SizedBox(height: 10),
          CustomRowLognOrSignup(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            title: "Login",
          ),
        ],
      ),
    );
  }
}
