
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/Utils/Utils.dart';
import 'package:provider/provider.dart';
import '../../Model/LoginModel.dart';
import '../../Repository/AuthrepoSitory.dart';
import '../UserViewModel/UserViewModel.dart';

class AuthViewmodel with ChangeNotifier {


  final authRepo = AutthReopsitory();
  bool _loading = false ;
  bool get loading => _loading ;

  setloading(val){
    _loading = val ;
    notifyListeners();
  }

  Future<void>LoginProcess( dynamic data,context)async{

    final userPreference = Provider.of<UserViewModel>(context , listen: false);

        if(data["email"] == '' || data["password"] == ''){
            Utils.flashbarMethod("all field is required", context) ;
            print(data);
        }else{
          setloading(true);
            authRepo.Loginprocess(data).then((value){
              setloading(false);
                if(kDebugMode){
                  print(value.toString());
                }
                print(value);
              userPreference.SaveUserp(
                  UserModel(
                      token: value['token'].toString()
                  )
              );
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