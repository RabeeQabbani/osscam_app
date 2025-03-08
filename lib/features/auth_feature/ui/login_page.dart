// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/constants/color.dart';
import 'package:osscam_app2/features/project_manger_feature/ui/create_and_join_page.dart';
import 'package:osscam_app2/customs/elevated_button.dart';
import 'package:osscam_app2/customs/password_textfield.dart';
import 'package:osscam_app2/customs/row_login_or_signup.dart';
import 'package:osscam_app2/customs/row_remember_me.dart';
import 'package:osscam_app2/customs/textfield.dart';
import 'package:osscam_app2/features/auth_feature/bloc/auth_bloc.dart';
import 'package:osscam_app2/features/auth_feature/ui/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  //bool isPasswordVisible = false;
  bool isRememberMeClicked = false;

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
                        isVisible: false,
                      ),
                      SizedBox(height: 64),
                      CustomRowRememberMe(
                        value: isRememberMeClicked,
                        onChanged: (_) {
                          setState(() {
                            isRememberMeClicked = !isRememberMeClicked;
                          });
                        },
                      ),
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
          BlocConsumer<AuthBloc, AuthState>(
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
              } else if (state is FailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is LoadingState
                  ? Center(child: CircularProgressIndicator.adaptive())
                  : CustomElevatedButton(
                    title: "Login",
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        LoginEvent(
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
