import 'dart:convert';

import 'package:portfolio_prova_segundo_bimestre/models/academic_training.dart';
import 'package:portfolio_prova_segundo_bimestre/models/detail.dart';
import 'package:portfolio_prova_segundo_bimestre/models/experience.dart';
import 'package:portfolio_prova_segundo_bimestre/models/project.dart';
import 'package:portfolio_prova_segundo_bimestre/models/skill.dart';

class Portfolio {
  Portfolio({
    this.detail,
    this.academicTrainings,
    this.experiences,
    this.projects,
    this.skills,
  });

  Detail detail;
  List<AcademicTraining> academicTrainings;
  List<Experience> experiences;
  List<Project> projects;
  List<Skill> skills;

  factory Portfolio.fromJson(String str) => Portfolio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Portfolio.fromMap(Map<String, dynamic> json) => Portfolio(
    detail: Detail.fromMap(json["detail"]),
    academicTrainings: List<AcademicTraining>.from(json["academicTrainings"].map((x) => AcademicTraining.fromMap(x))),
    experiences: List<Experience>.from(json["experiences"].map((x) => Experience.fromMap(x))),
    projects: List<Project>.from(json["projects"].map((x) => Project.fromMap(x))),
    skills: List<Skill>.from(json["skills"].map((x) => Skill.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "detail": detail.toMap(),
    "academicTrainings": List<dynamic>.from(academicTrainings.map((x) => x.toMap())),
    "experiences": List<dynamic>.from(experiences.map((x) => x.toMap())),
    "projects": List<dynamic>.from(projects.map((x) => x.toMap())),
    "skills": List<dynamic>.from(skills.map((x) => x.toMap())),
  };
}