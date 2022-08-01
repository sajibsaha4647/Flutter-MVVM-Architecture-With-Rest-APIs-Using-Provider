import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static Toasts(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.deepOrange,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white);
  }

//adding flash bar here
  static void flashbarMethod(String message, BuildContext context){
        showFlushbar(context: context, flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.all(15),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          message: message,
          title: "mvvm",
          backgroundColor: Colors.pinkAccent,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

}
