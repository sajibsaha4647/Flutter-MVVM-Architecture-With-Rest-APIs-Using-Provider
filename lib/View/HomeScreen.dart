import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/ViewModel/UserViewModel/UserViewModel.dart';
import 'package:provider/provider.dart';

import '../Utils/Utils.dart';
import '../ViewModel/AuthViewmodel/RegistrationViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final userviewmodel = Provider.of<UserViewModel>(context) ;

    // print();
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Home screen"),),
      body: Center(
        child: InkWell(
          onTap: (){
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.flashbarMethod("connection error",context);
            // Utils.Snackbar("new test",context);
            userviewmodel.Removep();
          },
         child: Text("Homescreen"),
        )
      ),
    ));
  }
}
