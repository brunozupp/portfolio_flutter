import 'package:portfolio_prova_segundo_bimestre/models/portfolio.dart';

abstract class IDetailService {

  Future<Portfolio> getPortfolio();
  
}