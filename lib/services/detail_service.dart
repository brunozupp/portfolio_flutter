import 'dart:io';

import 'package:get/get.dart';
import 'package:portfolio_prova_segundo_bimestre/interfaces/idetail_service.dart';
import 'package:portfolio_prova_segundo_bimestre/models/detail.dart';
import 'package:portfolio_prova_segundo_bimestre/models/portfolio.dart';

class DetailService extends GetConnect implements IDetailService {

  @override
  void onInit() {
    super.onInit();

    httpClient.defaultContentType = 'application/json';
    httpClient.baseUrl = "http://www.novelitech.com.br/api/details";
  }
    
  @override
  Future<Portfolio> getPortfolio() async {
    
    //Retorna um map e não um json
    var response = await get("http://www.novelitech.com.br/api/details/getPortfolio");

    if(response.hasError || response.statusCode == HttpStatus.badRequest)
      return null;

    Portfolio portfolio = Portfolio.fromMap(response.body);

    // Map<String, String> headers = {
    //   HttpHeaders.contentTypeHeader: 'application/json'
    // };

    // Response<Portfolio> portfolio = await get<Portfolio>(
    //     "http://www.novelitech.com.br/api/details/getPortfolio",
    //     headers: headers,
    // );

    return portfolio;
  }
  
}