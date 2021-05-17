import 'dart:convert';

class Detail {
  Detail({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    this.linkedin,
    this.instagram,
    this.facebook,
    this.nationality,
    this.about,
    this.goals,
    this.photo,
  });

  int id;
  String name;
  String email;
  String phone;
  DateTime birthDate;
  String linkedin;
  String instagram;
  String facebook;
  String nationality;
  String about;
  String goals;
  String photo;

  factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birthDate: DateTime.parse(json["birthDate"]),
    linkedin: json["linkedin"],
    instagram: json["instagram"],
    facebook: json["facebook"],
    nationality: json["nationality"],
    about: json["about"],
    goals: json["goals"],
    photo: json["photo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "birthDate": birthDate.toIso8601String(),
    "linkedin": linkedin,
    "instagram": instagram,
    "facebook": facebook,
    "nationality": nationality,
    "about": about,
    "goals": goals,
    "photo": photo,
  };
}