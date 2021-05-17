import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/models/skill.dart';

class SkillPage extends StatelessWidget {

  final List<Skill> skills;

  const SkillPage({Key key, @required this.skills}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,240,84,0),
        title: Text("Habilidades (0 á 5)"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Container(
            width: Get.width,
            height: 0.7,
            color: Colors.black54
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {

            var skill = skills[index];

            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[100]
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: _colorByAptitude(skill.aptitude),
                        shape: BoxShape.circle
                      ),
                      child: Text(
                        skill.aptitude.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      skill.name,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
            
          },
        ),
      ),
    );
  }

  Color _colorByAptitude(double value) {

    if(value >= 0.0 && value <= 1.0) return Colors.red[900];

    if(value > 1.0 && value <= 2.0) return Colors.yellow[900];
    
    if(value > 1.0 && value <= 3.0) return Colors.purple[900];

    if(value > 1.0 && value <= 4.0) return Colors.blue[900];

    if(value > 1.0 && value <= 5.0) return Colors.green[900];

    return Colors.black;

  }
}