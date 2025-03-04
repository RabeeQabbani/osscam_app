import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/features/create_and_join_feature/bloc/project_bloc.dart';
import 'package:osscam_app2/features/create_and_join_feature/service/project_service.dart';
import 'package:osscam_app2/features/create_and_join_feature/ui/create_and_join_page.dart';
import 'package:osscam_app2/features/login_feature/bloc/login_bloc.dart';
import 'package:osscam_app2/features/login_feature/service/login_service.dart';
import 'package:osscam_app2/features/login_feature/ui/login_page.dart';
import 'package:osscam_app2/features/signup_feature/bloc/bloc/signup_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
 await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(service: AuthServicesImple(dio: Dio())),
        ),
           BlocProvider(
          create: (context) => SignupBloc(service: AuthServicesImple(dio: Dio())),
        ),
           BlocProvider(
          create: (context) => ProjectBloc(projectService: ProjectServiceImple(dio: Dio())),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, 
      
      home: sl<SharedPreferences>().get("token") ==null?LoginPage():CreateAndJoinPage()),
    );
  }
}
