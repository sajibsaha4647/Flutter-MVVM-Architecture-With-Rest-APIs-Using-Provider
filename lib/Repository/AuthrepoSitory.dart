

import 'package:fluttermvvm/Data/Network/BaseApiservice.dart';
import 'package:fluttermvvm/Data/Network/NetworkApiService.dart';
import 'package:fluttermvvm/res/App_urls.dart';

class AutthReopsitory {

  BaseApiservices baseApiservices = NetworkApiServiece() ;


  Future<dynamic>Loginprocess(dynamic data,header)async{

    try{
      dynamic response = baseApiservices.getPostApiResponse(AppUrls.loginApi, data, header);
      return response ;

    }catch(e){
      throw e ;
    }
  }


  Future<dynamic>RegistrationProcess(dynamic data, header){
    try{
      dynamic response = baseApiservices.getPostApiResponse(AppUrls.registration, data, header) ;
      return response ;
    }catch(e){
      throw e ;
    }

  }

}