import 'dart:convert';

class Experience {
  Experience({
    this.id,
    this.company,
    this.description,
    this.begin,
    this.end,
  });

  int id;
  String company;
  String description;
  DateTime begin;
  DateTime end;

  factory Experience.fromJson(String str) => Experience.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Experience.fromMap(Map<String, dynamic> json) => Experience(
    id: json["id"],
    company: json["company"],
    description: json["description"],
    begin: DateTime.parse(json["begin"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "company": company,
    "description": description,
    "begin": begin.toIso8601String(),
    "end": end.toIso8601String(),
  };
}