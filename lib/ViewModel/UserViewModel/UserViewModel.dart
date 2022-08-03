import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Utils.dart';
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


   Future<bool> Removep(BuildContext context)async{
    // final SharedPreferences sp = await SharedPreferences.getInstance();
     final prefs = await SharedPreferences.getInstance();
     final success = await prefs.remove('token');
    return success ;
  }

  Future<bool> clearp()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true ;
  }


}
