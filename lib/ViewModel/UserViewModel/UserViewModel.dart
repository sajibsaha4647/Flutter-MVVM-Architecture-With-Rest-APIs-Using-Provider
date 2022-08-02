import 'package:flutter/material.dart';
import 'package:fluttermvvm/Model/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {



  Future<bool> SaveUserp(LoginModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("LoginToken", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<LoginModel> GetUserp() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    final String? token  = sp.getString("LoginToken") ;

    return LoginModel(
      token: token
    );

  }


  void Removep()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("LoginToken") ;
  }

  void clearp()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }


}
