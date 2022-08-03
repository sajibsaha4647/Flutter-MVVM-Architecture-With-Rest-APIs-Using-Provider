

import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/ViewModel/HomeViewModel/HomeViewModel.dart';
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

  HomeViewModel homeViewModel = HomeViewModel() ;

  @override
  void initState() {
    homeViewModel.fetchUserDataApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userviewmodel = Provider.of<UserViewModel>(context) ;
    final UserDatamodels = Provider.of<HomeViewModel>(context) ;


    return SafeArea(child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("Home screen"),
        actions: [
          InkWell(
            onTap: (){
              userviewmodel.Removep(context).then((value){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(
             child: Text("Logout"),
            )
          ),
          SizedBox(width: 15,)
        ],
        ),
      body: Center(
        child:  Text("Homescreen"),
      ),
    ));
  }
}


