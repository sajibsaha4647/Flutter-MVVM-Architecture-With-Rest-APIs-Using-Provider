
import 'package:flutter/foundation.dart';
import 'package:fluttermvvm/Model/UserDataModel.dart';

import '../../Repository/HomeRepository.dart';
import '../../response/api_response.dart';

class HomeViewModel with ChangeNotifier{

  final HomeRepo = HomeRepository();

  ApiResponse<UserDataModel> userdata = ApiResponse.loading();

  setuserdataitems(ApiResponse<UserDataModel> response){
    userdata = response ;
    notifyListeners();
  }

  Future<void>fetchUserDataApi()async{
    setuserdataitems(ApiResponse.loading());
    HomeRepo.fetchUserDataApi().then((value){
      setuserdataitems(ApiResponse.success(value));
    }).onError((error, stackTrace){
      setuserdataitems(ApiResponse.failed(error.toString()));
    });

  }


}