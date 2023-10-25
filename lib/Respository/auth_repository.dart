import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:mvvm/Data/Network/networkApiservice.dart';
import 'package:mvvm/Resources/app_url.dart';

class Authrepository {
  final BaseApiServices _apiServices = NetworkApiServicce();

  Future<dynamic> logInApi(dynamic data) async {
    try {
      dynamic response=await _apiServices.getPostApiResponse(Appurl.loginApiendpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
    
  }
  Future<dynamic> signupterApi(dynamic data) async {
    try {
      dynamic response=await _apiServices.getPostApiResponse(Appurl.regisApiendpoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
}
}