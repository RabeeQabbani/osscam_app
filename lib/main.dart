import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osscam_app2/core/config/service_locater.dart';
import 'package:osscam_app2/features/project_manger_feature/bloc/project_bloc.dart';
import 'package:osscam_app2/features/project_manger_feature/service/project_service.dart';
import 'package:osscam_app2/features/auth_feature/bloc/auth_bloc.dart';
import 'package:osscam_app2/features/auth_feature/service/auth_service.dart';
import 'package:osscam_app2/features/auth_feature/ui/login_page.dart';

void main() async {
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
          create: (context) => AuthBloc(service: AuthServicesImple(dio: Dio())),
        ),
        BlocProvider(
          create:
              (context) =>
                  ProjectBloc(service: ProjectServiceImple(dio: Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:LoginPage(),
            // sl<SharedPreferences>().get("token") == null
            //     ? LoginPage()
            //     : CreateAndJoinPage(),
      ),
    );
  }
}
