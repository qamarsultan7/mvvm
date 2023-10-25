import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:mvvm/Data/Network/networkApiservice.dart';
import 'package:mvvm/Model/movies_model.dart';
import 'package:mvvm/Resources/app_url.dart';

class MovieRepository {
  final BaseApiServices _apiServices = NetworkApiServicce();

  Future<Movieslist> fetchmovie() async {
    try {
      dynamic response=await _apiServices.getGetApiResponse(Appurl.moviesListEndPoint);
      return response=Movieslist.fromJson(response);
    } catch (e) {
      rethrow;
    }
    
  }
}