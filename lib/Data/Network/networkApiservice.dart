// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm/Data/Exceptions.dart';
import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServicce extends BaseApiServices {


  @override
  Future getGetApiResponse(String url)async {
    dynamic responsejason;
   try {
     final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
     responsejason=returnresponse(response);
   } on SocketException {
     throw FetchDataExceptions('No internet Connection');
   }
   return responsejason;
  }

  @override
  Future getPostApiResponse(String url,dynamic data)async {
   dynamic responsejason;
   try {
     Response response=await post(Uri.parse(url),body:data).timeout(const Duration(seconds: 15));
     responsejason=returnresponse(response);
   } on SocketException {
     throw FetchDataExceptions('No internet Connection');
   }
   return responsejason;
  }
  
  
  dynamic returnresponse(http.Response response){
    switch (response.statusCode) {
      case 200:
        dynamic responsejason=jsonDecode(response.body);
        return responsejason;
      case 400:
      throw BadrequestException(response.statusCode.toString());
      case 404:
      throw UnauthorizedExceptions(response.statusCode.toString());
      default:
      throw FetchDataExceptions('Error Occured while connecting to the serevr ${response.statusCode}');
    }
  }
}