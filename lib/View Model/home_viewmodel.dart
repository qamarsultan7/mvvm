import 'package:flutter/material.dart';
import 'package:mvvm/Data/Response/api_response.dart';
import 'package:mvvm/Model/movies_model.dart';
import 'package:mvvm/Respository/movie_repository.dart';

class HomeviewModel with ChangeNotifier {
  final _movierepo = MovieRepository();
  Apiresponse<Movieslist> movielist = Apiresponse.loading();
  setMovieslist(Apiresponse<Movieslist> response) {
    movielist = response;
    notifyListeners();
  }
  Future<void> fetchmovielist() async {
    setMovieslist(Apiresponse.loading());
    _movierepo.fetchmovie().then((value) {
      setMovieslist(Apiresponse.completed(value));

    }).onError((error, stackTrace) {
      setMovieslist(Apiresponse.error(error.toString()));
      print(error.toString());
    });
    notifyListeners();
  }
}
