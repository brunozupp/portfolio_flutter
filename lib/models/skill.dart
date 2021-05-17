import 'dart:convert';

class Skill {
  Skill({
    this.id,
    this.name,
    this.aptitude,
  });

  int id;
  String name;
  double aptitude;

  factory Skill.fromJson(String str) => Skill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Skill.fromMap(Map<String, dynamic> json) => Skill(
    id: json["id"],
    name: json["name"],
    aptitude: json["aptitude"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "aptitude": aptitude,
  };
}