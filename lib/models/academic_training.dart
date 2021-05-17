import 'dart:convert';

class AcademicTraining {
  AcademicTraining({
    this.id,
    this.name,
    this.institution,
    this.begin,
    this.end,
  });

  int id;
  String name;
  String institution;
  DateTime begin;
  DateTime end;

  factory AcademicTraining.fromJson(String str) => AcademicTraining.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicTraining.fromMap(Map<String, dynamic> json) => AcademicTraining(
    id: json["id"],
    name: json["name"],
    institution: json["institution"],
    begin: DateTime.parse(json["begin"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "institution": institution,
    "begin": begin.toIso8601String(),
    "end": end.toIso8601String(),
  };
}