import 'package:flutter/material.dart';

import '../Utils/Routes/RoutesName.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
          appBar: AppBar(
            title: Text("Login screen"),
          ),
      body: Center(
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Text("Home screen"),
          )
      ),
    ));

  }
}
