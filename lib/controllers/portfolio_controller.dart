import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/interfaces/idetail_service.dart';
import 'package:portfolio_prova_segundo_bimestre/models/portfolio.dart';
import 'package:portfolio_prova_segundo_bimestre/services/detail_service.dart';

class PortfolioController extends GetxController {

  static PortfolioController get to => Get.find();

  IDetailService _detailService;

  var _numberPage = 0.obs;
  int get numberPage => _numberPage.value;
  set numberPage(int value) => _numberPage(value);

  @override
  void onInit() {
    super.onInit();

    _detailService = DetailService();
  }

  Future<Portfolio> getPortfolio() async {
    
    var result = await _detailService.getPortfolio();

    return result;
  }
}