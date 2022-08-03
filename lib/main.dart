import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/Routes.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/View/LoginScreen.dart';
import 'package:fluttermvvm/ViewModel/AuthViewmodel/AuthViewModel.dart';
import 'package:fluttermvvm/ViewModel/AuthViewmodel/RegistrationViewModel.dart';
import 'package:provider/provider.dart';

import 'ViewModel/UserViewModel/UserViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>AuthViewmodel()),
      ChangeNotifierProvider(create: (_)=>RegistrationViewModel()),
      ChangeNotifierProvider(create: (_)=>UserViewModel()),

    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashscreen,
      onGenerateRoute: Routes.generateRoute ,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    ));
  }
}


