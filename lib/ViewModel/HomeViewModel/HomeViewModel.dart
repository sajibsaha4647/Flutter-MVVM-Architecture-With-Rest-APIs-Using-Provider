
import 'package:flutter/foundation.dart';
import 'package:fluttermvvm/Model/UserDataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../Repository/HomeRepository.dart';
import '../../response/api_response.dart';

class HomeViewModel with ChangeNotifier{

  final HomeRepo = HomeRepository();






  final _myRepo = HomeRepository() ;

    var _loading ;
    get loading => _loading ;
    setloading(val){
      _loading = val ;
      notifyListeners();
    }

    var _error = 10;
    get error => _error ;
    seterror(val){
      _error = val ;
      notifyListeners();
  }


  ApiResponse<UserDataModel> userdata = ApiResponse.loading();

  setMoviesList(ApiResponse<UserDataModel> response){
    userdata = response ;
    notifyListeners();
  }



  Future<void> fetchMoviesListApi ()async{

    // setMoviesList(ApiResponse.loading());

    setloading(true);
    seterror(12);
    print(_error);
    print( "truel $_loading");

    _myRepo.fetchUserDataApi().then((value){
      if(value.data?.email != null){
        print("appppp ${value.toJson()}");
      }else{
        print("appppp ${value.data?.email}");
      }
      setloading(false);
      print( "falsel $_loading");
      seterror(13);
      print(_error);
      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setMoviesList(ApiResponse.error(error.toString()));
      setloading(false);

      print( "falseerrl $_loading");
      seterror(14);
      print(_error);
    });
  }





}




