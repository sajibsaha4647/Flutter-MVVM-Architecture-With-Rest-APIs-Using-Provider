
import 'package:fluttermvvm/res/App_urls.dart';

import '../Data/Network/BaseApiservice.dart';
import '../Data/Network/NetworkApiService.dart';
import '../Model/UserDataModel.dart';

class HomeRepository {

  BaseApiservices baseApiservices = NetworkApiServiece() ;

  Future<UserDataModel>fetchUserDataApi()async{
    try{
      dynamic response = await baseApiservices.getGetApiResponse(AppUrls.getUserdataApi);
      return response = UserDataModel.fromJson(response) ;
    }catch(e){
      throw e ;
    }

  }

}