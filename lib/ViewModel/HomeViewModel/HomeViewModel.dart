
import 'package:flutter/foundation.dart';
import 'package:fluttermvvm/Model/UserDataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../Repository/HomeRepository.dart';
import '../../response/api_response.dart';

class HomeViewModel with ChangeNotifier{

  final HomeRepo = HomeRepository();

  // ApiResponse<UserDataModel> userdata = ApiResponse.loading();


  bool _loading = false ;

  bool get loading => _loading ;

  setloading(val){
    _loading = val ;
    notifyListeners();
  }

  final _myRepo = HomeRepository()

  ApiResponse<UserDataModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<UserDataModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    _myRepo.fetchUserDataApi().then((value){

      setMoviesList(ApiResponse.success(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.failed(error.toString()));

    });
  }





}




