import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/core/utils.dart';
import 'package:portfolio_prova_segundo_bimestre/models/detail.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/inline_information.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/widgets/separator.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMePage extends StatelessWidget {

  final Detail detail;

  const AboutMePage({Key key, @required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,240,84,0),
        title: Text("Sobre mim"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), 
                        BlendMode.darken
                      ),
                      fit: BoxFit.fitWidth,
                      image: AssetImage("assets/fundo_programacao.png"),
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(detail.photo)
                      )
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InlineInformation(title: "Nome: ", information: detail.name),
                  InlineInformation(title: "Nacionalidade: ", information: detail.nationality),
                  InlineInformation(title: "Idade: ", information: Utils.age(detail.birthDate) + " anos"),

                  Separator(),
                  
                  Text(
                    "Informações de contato",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  InlineInformation(title: "Email: ", information: detail.email),
                  InlineInformation(title: "Telefone: ", information: detail.phone),

                  SizedBox(height: 10),

                  Wrap(
                    runSpacing: 10,
                    spacing: 5,
                    children: [
                      _cardContact(
                        iconData: FontAwesomeIcons.whatsapp,
                        description: "Whatsapp",
                        colorContainer: Colors.green[600],
                        function: () async {

                          var whatsappUrl = "whatsapp://send?phone=+" + detail.phone;

                          if(await canLaunch(whatsappUrl)) {
                            await launch(whatsappUrl);
                          } else {
                            Get.snackbar(
                              "Ação não aceita", 
                              "Por algum problema interno, não foi possível conectar ao whatsapp",
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.grey[350]
                            );
                          }
                        }
                      ),

                      _cardContact(
                        iconData: FontAwesomeIcons.facebook,
                        description: "Facebook",
                        colorContainer: Colors.blue[900],
                        function: () async {
                          await launch(detail.facebook);
                        }
                      ),

                      _cardContact(
                        iconData: FontAwesomeIcons.instagram,
                        description: "Instagram",
                        colorContainer: Colors.pink[400],
                        function: () async {
                          await launch(detail.instagram);
                        }
                      ),

                      _cardContact(
                        iconData: FontAwesomeIcons.linkedin,
                        description: "Linkedin",
                        colorContainer: Colors.blue[900],
                        function: () async {
                          await launch(detail.linkedin);
                        }
                      ),
                    ],
                  ),
                  
                  Separator(),

                  Text(
                    "Quem sou eu?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    detail.about,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),

                  Separator(),

                  Text(
                    "Meus objetivos?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Text(
                    detail.goals,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardContact({
    @required IconData iconData,
    @required Color colorContainer,
    Color colorIcon = Colors.white,
    @required String description,
    Function function
  }) {
    return GestureDetector(
      onTap: function ?? () {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colorContainer
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(iconData, color: colorIcon),
            SizedBox(width: 5),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}