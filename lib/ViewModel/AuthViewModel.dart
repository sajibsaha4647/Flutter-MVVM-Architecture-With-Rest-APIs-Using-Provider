
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/Utils/Utils.dart';
import '../Repository/AuthrepoSitory.dart';

class AuthViewmodel with ChangeNotifier {


  final authRepo = AutthReopsitory();
  bool _loading = false ;
  bool get loading => _loading ;

  setloading(val){
    _loading = val ;
    notifyListeners();
  }

  Future<void>LoginProcess( dynamic data,header,context)async{
        if(data["email"] == '' || data["password"] == ''){
            Utils.flashbarMethod("all field is required", context) ;
        }else{
          setloading(true);
            authRepo.Loginprocess(data, header).then((value){
              setloading(false);
                if(kDebugMode){
                  print(value.toString());
                }
                Navigator.pushNamed(context, RoutesName.home);
                Utils.flashbarMethod("Successfully login", context) ;
            }).onError((error, stackTrace) {
              setloading(false);
              if(kDebugMode){
                print(error.toString());
              }
              Utils.flashbarMethod(error.toString(), context) ;
            });
        }
  }

}