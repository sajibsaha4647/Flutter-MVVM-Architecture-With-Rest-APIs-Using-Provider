import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';

import '../Utils/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(title: Text("Home screen"),),
      body: Center(
        child: InkWell(
          onTap: (){
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.flashbarMethod("connection error",context);
            Utils.Snackbar("new test",context);
          },
         child: Text("Home screen"),
        )
      ),
    ));
  }
}
