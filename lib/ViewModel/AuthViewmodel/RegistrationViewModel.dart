
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../Repository/AuthrepoSitory.dart';
import '../../Utils/Routes/RoutesName.dart';
import '../../Utils/Utils.dart';

class RegistrationViewModel with ChangeNotifier {


  final authRepo = AutthReopsitory();

  bool _loading = false ;
  bool get loading => _loading ;

  var mydata = "" ;
  get data => mydata;

  setmydata(val){
    mydata = val ;
  }

  setloading(val){
    _loading = val ;
    notifyListeners();
  }

  Future<void>RegistrationProcess( dynamic data,context)async{
    if(data["email"] == '' || data["password"] == ''){
      Utils.flashbarMethod("all field is required", context) ;
      print(data);
    }else{
      setloading(true);
      authRepo.RegistrationProcess(data).then((value){
        setloading(false);
        if(kDebugMode){
          print(value.toString());
        }
        setmydata(value);
        Navigator.pushNamed(context, RoutesName.home);
        Utils.flashbarMethod("Successfully Signup", context) ;
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