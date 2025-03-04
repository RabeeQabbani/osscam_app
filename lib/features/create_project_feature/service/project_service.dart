// // ignore_for_file: unused_local_variable, avoid_print, body_might_complete_normally_nullable
// import 'package:dio/dio.dart';

// abstract class ProjectService {
//   Dio dio;
//   String resource = "http://localhost:3011/api/v1/projects/";
//   ProjectService({required this.dio});
//   Future<void> createProject(
//     String projectName,
//     String description,
   
//   );
// }

// class ProjectServiceImp extends ProjectService {
//   ProjectServiceImp({required super.dio});

//   @override
//   Future<void> createProject(
//     String projectName,
//     String projectDescription,
//   ) async {
//     try {
//       Response response = await dio.post(
//         resource,
//         data: {
//           "projectName": projectName,
//           "projectDescription": projectDescription,
//           "projectStatus": "projectStatus",
//         },
//       );
//       print(response.data.id);
//     } catch (e) {
//       print("Failed to create project: $e");
//     }
//   }
// }
