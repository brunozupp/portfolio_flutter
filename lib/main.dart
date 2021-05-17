import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/controllers/portfolio_controller.dart';
import 'package:portfolio_prova_segundo_bimestre/home_binding.dart';
import 'package:portfolio_prova_segundo_bimestre/models/portfolio.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/presentation/portfolio_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/status_operation/error_page.dart';
import 'package:portfolio_prova_segundo_bimestre/pages/status_operation/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final PortfolioController _portfolioController = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      title: 'Portfólio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _initialNavigation(),
    );
  }

  FutureBuilder<Portfolio> _initialNavigation() {
    return FutureBuilder<Portfolio>(
    future: _portfolioController.getPortfolio(),
      builder: (context, snapshot) {

        if(snapshot.hasError) return ErrorPage();

        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null)
          return PortfolioPage(
            portfolio: snapshot.data,
          );

        return LoadingPage();
      },
    );
  }
}