import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/LoginModel.dart';

class UserViewModel with ChangeNotifier {



  Future<bool> SaveUserp(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> GetUserp() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token  = sp.getString("token") ;
    return UserModel(
      token: token.toString()
    );
  }


   Future<bool> Removep()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("LoginToken") ;
    return true ;
  }

  Future<bool> clearp()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true ;
  }


}
