

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_prestapyme/src/domain/models/articles/response_get_list_articles_model.dart';

class GetArticlesService with ChangeNotifier{

  bool _loadingGetInfo = false;
  ResponseGetListArticles _responseGetListArticles = ResponseGetListArticles();
  int _paginationArticles = 0;
  int _listOfArticlesWithPaginationAndFirtsLoad = 0;
  int _statusCode = 0; 

  List<Datum> _listGetArticlesOfResponse = [];

  List<Datum> get listGetArticlesOfResponse =>_listGetArticlesOfResponse;
  set listGetArticlesOfResponse (List<Datum> valor){
    _listGetArticlesOfResponse = valor;
    notifyListeners();
  }

  
  int get listOfArticlesWithPaginationAndFirtsLoad => _listOfArticlesWithPaginationAndFirtsLoad;
  set listOfArticlesWithPaginationAndFirtsLoad (int valor){
    _listOfArticlesWithPaginationAndFirtsLoad = valor;
    notifyListeners();
  }

  int get statusCode => _statusCode;
  set statusCode (int valor){
    _statusCode = valor;
    notifyListeners();
  }

  void addArticles(List<Datum> articles){
    listGetArticlesOfResponse.addAll(articles);
    notifyListeners();
  }

  bool get loadingGetInfo =>_loadingGetInfo;
  set loadingGetInfo (bool valor){
    _loadingGetInfo = valor;
    notifyListeners();
  }

  int get paginationArticles =>_paginationArticles;
  set paginationArticles (int valor){
    _paginationArticles = valor;
    notifyListeners();
  }

  ResponseGetListArticles get responseGetListArticles =>_responseGetListArticles;
  set responseGetListArticles (ResponseGetListArticles valor){
    _responseGetListArticles = valor;
    notifyListeners();
  }

  Future<ResponseGetListArticles> getListArticlesService(
    String page
    ) async {
     loadingGetInfo = true; 
    try {
      final url = Uri.https( "api.cambioseguro.com", "/api/v1.1/config/articles",{
          "from":"1",
          "to":(int.tryParse("1")!*5).toString(),
        });

        final resp = await http.get(
         url,
       ).timeout(
        const Duration(seconds: 5),
        onTimeout: (){
         return http.Response("Error",408);
        }
       );
      statusCode = resp.statusCode;
     if (resp.statusCode == 200) {
      final response =  ResponseGetListArticles.fromRawJson(resp.body);
      listOfArticlesWithPaginationAndFirtsLoad = response.data!.length;
      return response;
     }else{
      return ResponseGetListArticles(
        data: [],
        message: "error"
      );
    }  
    } catch (e) {
      statusCode = 508; 
      return ResponseGetListArticles(
        data: [],
        message: "error"
      );
    }
     
  }

  Future<ResponseGetListArticles> getListArticlesServicewithPagination(
    String page
    ) async {
      final url = Uri.https( "api.cambioseguro.com", "/api/v1.1/config/articles",{
          "from":page,
          "to":(int.tryParse(page)!*5).toString(),
        });

        final resp = await http.get(
         url,
       );
    if (resp.statusCode == 200) {
      final response =  ResponseGetListArticles.fromRawJson(resp.body);
      listOfArticlesWithPaginationAndFirtsLoad = response.data!.length;
      return response;
    }else{
      return ResponseGetListArticles(
        data: [],
        message: "error"
      );
    } 
  }
}