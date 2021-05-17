import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/core/utils.dart';
import 'package:portfolio_prova_segundo_bimestre/models/experience.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/inline_information.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/separator.dart';

class ExperiencePage extends StatelessWidget {

  final List<Experience> experiences;

  const ExperiencePage({
    Key key, @required this.experiences
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,240,84,0),
        title: Text("Experiências"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            width: Get.width,
            height: 0.7,
            color: Colors.black54
          ),
          itemCount: experiences.length,
          itemBuilder: (context, index) {

            var experience = experiences[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[100]
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: ExpandablePanel(
                  header: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InlineInformation(
                        title: "Empresa: ",
                        information: experience.company,
                      ),
                      InlineInformation(
                        title: "Início: ",
                        information: Utils.shortDate(experience.begin),
                      ),
                      InlineInformation(
                        title: "Término: ",
                        information: Utils.shortDate(experience.end),
                      ),
                    ],
                  ),
                  expanded: Column(
                    children: [
                      Separator(),
                      Text(
                        experience.description,
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