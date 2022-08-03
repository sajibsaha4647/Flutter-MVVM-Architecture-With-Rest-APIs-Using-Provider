

import 'package:fluttermvvm/Data/Network/BaseApiservice.dart';
import 'package:fluttermvvm/Data/Network/NetworkApiService.dart';
import 'package:fluttermvvm/res/App_urls.dart';

class AutthReopsitory {

  BaseApiservices baseApiservices = NetworkApiServiece() ;


  Future<dynamic>Loginprocess(dynamic data)async{

    try{
      dynamic response = baseApiservices.getPostApiResponse(AppUrls.loginApi, data);
      return response ;
    }catch(e){
      throw e ;
    }
  }


  Future<dynamic>RegistrationProcess(dynamic data)async{

    try{
      dynamic response = baseApiservices.getPostApiResponse(AppUrls.registrationApi, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

}