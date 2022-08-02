
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/ViewModel/UserViewModel/UserViewModel.dart';

import '../../Model/LoginModel.dart';

class SplashViewServices{


  //retrive here check auth
  void checkAuthenticationService( BuildContext context ){

    Future<LoginModel>getuserData() => UserViewModel().GetUserp();

    getuserData().then((value) async{

      if(value == null || value == ''){
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login) ;
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home) ;
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}