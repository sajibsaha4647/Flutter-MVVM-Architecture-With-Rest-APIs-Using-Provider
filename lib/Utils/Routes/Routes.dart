
import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/View/HomeScreen.dart';
import 'package:fluttermvvm/View/LoginScreen.dart';

class Routes {

  static MaterialPageRoute generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home :
        return MaterialPageRoute(builder: (BuildContext context)=>const HomeScreen());
      case RoutesName.login :
        return MaterialPageRoute(builder: (BuildContext context)=>const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const SafeArea(child: Scaffold(
            body:Center(
              child: Text("No routes found !"),
            ) ,
          ));
        });
    }

  }

}