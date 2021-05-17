import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/models/project.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/separator.dart';

class ProjectsPage extends StatelessWidget {

  final List<Project> projects;

  const ProjectsPage({Key key, @required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,240,84,0),
        title: Text("Projetos"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            width: Get.width,
            height: 0.7,
            color: Colors.black54
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {

            var project = projects[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[100]
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      project.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  
                  expanded: Column(
                    children: [
                      Separator(),
                      Text(
                        project.description,
                        style: TextStyle(
                          fontSize: 16
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}