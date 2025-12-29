import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_demu_project/data/exceptions/app_exceptions.dart';
import 'package:clean_architecture_demu_project/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi implements BaseApiServices{
 
  @override
  Future<dynamic> getApi(String url) async{

    dynamic jsonResonse;
    try{
      final response = await http.get(Uri.parse(url));
      jsonResonse = returnResponse(response);
      if(response.statusCode==200){

      }
    } on SocketException{
      throw NoInternetException("No internet connection...");
    }
    on TimeoutException{
      throw RequestTimeOutException("Timeout, please try again...");
    }
    return jsonResonse;
  }






  @override
  Future<dynamic> postApi(String url, var data) async{
     dynamic jsonResonse;
    try{
      final response = await http.post(Uri.parse(url),
      body: data,
      );
      jsonResonse = returnResponse(response);
      if(response.statusCode==200){

      }
    } on SocketException{
      throw NoInternetException("No internet connection...");
    }
    on TimeoutException{
      throw RequestTimeOutException("Timeout, please try again...");
    }
    return jsonResonse;
  
  }


   @override
  Future<dynamic> deleteAPI(String url) async{
  
  }



  dynamic returnResponse(http.Response response){
    switch(response.statusCode){

      case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;

      case 400:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
      
      case 401:
      throw UnAuthorizedException("Unauthorized error: $response.statusCode.toString() ");

      case 500:
      throw FetchDataException("Error while fetching data: $response.statusCode.toString() ");
    }
  }

}