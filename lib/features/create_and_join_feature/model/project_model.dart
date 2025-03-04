import 'package:meta/meta.dart';
import 'dart:convert';

class ProjectModel {
  final int id;
  final String name;
  final String description;
  final String status;
  final DateTime createDate;
  final DateTime lastModified;
  final String lastModifiedBy;
  final String createdBy;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.createDate,
    required this.lastModified,
    required this.lastModifiedBy,
    required this.createdBy,
  });

  factory ProjectModel.fromRawJson(String str) =>
      ProjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    status: json["status"],
    createDate: DateTime.parse(json["createDate"]),
    lastModified: DateTime.parse(json["lastModified"]),
    lastModifiedBy: json["lastModifiedBy"],
    createdBy: json["createdBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "status": status,
    "createDate": createDate.toIso8601String(),
    "lastModified": lastModified.toIso8601String(),
    "lastModifiedBy": lastModifiedBy,
    "createdBy": createdBy,
  };
}
