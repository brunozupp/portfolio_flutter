import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/core/utils.dart';
import 'package:portfolio_prova_segundo_bimestre/models/academic_training.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/inline_information.dart';

class AcademicTrainingPage extends StatelessWidget {

  final List<AcademicTraining> academicTrainings;

  const AcademicTrainingPage({
    Key key, @required this.academicTrainings
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,240,84,0),
        title: Text("Formações"),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Container(
          width: Get.width,
          height: 0.7,
          color: Colors.black54
        ),
        itemCount: academicTrainings.length,
        itemBuilder: (context, index) {

          var training = academicTrainings[index];

          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[100]
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InlineInformation(
                      title: "Formação: ", 
                      information: training.name
                    ),
                    InlineInformation(
                      title: "Instituição: ", 
                      information: training.institution
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InlineInformation(
                      title: "Início: ", 
                      information: Utils.shortDate(training.begin)
                    ),
                    InlineInformation(
                      title: "Término: ", 
                      information: Utils.shortDate(training.end)
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}