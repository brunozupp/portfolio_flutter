import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/controllers/portfolio_controller.dart';
import 'package:portfolio_prova_segundo_bimestre/models/portfolio.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/about_me_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/academic_trainings_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/experiences_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/projects_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/skills_page.dart';

class PortfolioPage extends GetView<PortfolioController> {

  final Portfolio portfolio;

  final pageViewController = PageController(
    initialPage: 0,
  );

  PortfolioPage({this.portfolio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => _bottomNavigator(numberPage: controller.numberPage)),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              AboutMePage(detail: portfolio.detail),
              AcademicTrainingPage(academicTrainings: portfolio.academicTrainings),
              ExperiencePage(experiences: portfolio.experiences),
              ProjectsPage(projects: portfolio.projects),
              SkillPage(skills: portfolio.skills)
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigator({int numberPage = 0}) {
    return Container(
      height: 70,
      color: Color.fromARGB(255,240,84,0),
      child: ListView(
        scrollDirection: Axis.horizontal,
          children: [
            _itemOptionBottomNavigator(
              icon: Icons.person,
              description: "Sobre mim",
              numberPage: 0,
              isActivated: numberPage == 0,
            ),
            _itemOptionBottomNavigator(
              icon: Icons.camera_front_outlined,
              description: "Formações",
              numberPage: 1,
              isActivated: numberPage == 1,
            ),
            _itemOptionBottomNavigator(
              icon: Icons.work,
              description: "Experiências",
              numberPage: 2,
              isActivated: numberPage == 2,
            ),
            _itemOptionBottomNavigator(
              icon: Icons.smartphone,
              description: "Projetos",
              numberPage: 3,
              isActivated: numberPage == 3,
            ),
            _itemOptionBottomNavigator(
              icon: Icons.addchart_outlined,
              description: "Habilidades",
              numberPage: 4,
              isActivated: numberPage == 4,
            ),
          ],
      ),
    );
  }

  Widget _itemOptionBottomNavigator({
    @required IconData icon, 
    @required String description,
    @required int numberPage, 
    bool isActivated = false
  }) {
    return InkWell(
      onTap: () {
        _updatePage(numberPage: numberPage);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActivated ? Colors.white : Colors.black
            ),
            Text(
              description,
              style: TextStyle(
                color: isActivated ? Colors.white : Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updatePage({@required int numberPage}) {
    controller.numberPage = numberPage;
    pageViewController.jumpToPage(numberPage);
  }
}