import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/ViewModel/HomeViewModel/HomeViewModel.dart';
import 'package:fluttermvvm/ViewModel/UserViewModel/UserViewModel.dart';
import 'package:provider/provider.dart';

import '../Model/UserDataModel.dart';
import '../Utils/Utils.dart';
import '../ViewModel/AuthViewmodel/RegistrationViewModel.dart';
import '../response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();

    final homeviewmodels = Provider.of<HomeViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () {
      homeviewmodels.fetchMoviesListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userviewmodel = Provider.of<UserViewModel>(context);
    final homeviewmodels = Provider.of<HomeViewModel>(context, listen: true);

    if (kDebugMode) {
      print(homeviewmodels.userdata.toString());
    }

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text("Home screen"),
              actions: [
                InkWell(
                    onTap: () {
                      userviewmodel.Removep(context).then((value) {
                        Navigator.pushNamed(context, RoutesName.login);
                      });
                    },
                    child: const Center(
                      child: Text("Logout"),
                    )),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            body: Column(children: [
              Container(
                  child: ((() {
                if (homeviewmodels.userdata.status == Status.LOADING) {
                  return const Center(child: CircularProgressIndicator());
                } else if (homeviewmodels.userdata.status == Status.FAILED) {
                  return Center(
                      child: Text(homeviewmodels.userdata.message.toString()));
                } else {
                  return Center(
                      child: Text(homeviewmodels.userdata.data!.data!.email
                          .toString()));
                }
              }()))),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.homedetails);
                  homeviewmodels.seterror(40);
                },
                child: const Text("press"),
              )
            ])));
  }
}


// Text(homeviewmodels.userdata.data!.data!.email.toString()),
