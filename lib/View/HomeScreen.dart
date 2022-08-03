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
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userviewmodel = Provider.of<UserViewModel>(context);

    // final homeViewModels = Provider.of<HomeViewModel>(context,listen:  false);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Home screen"),
        actions: [
          InkWell(
              onTap: () {
                userviewmodel.Removep(context).then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(
                child: Text("Logout"),
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
          body: ChangeNotifierProvider<UserDataModel>(
            create: (BuildContext context) => HomeViewModel(),
            child: Consumer<HomeViewModel>(
                builder: (context, value, _){
                  switch(value.moviesList.status){
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Center(child: Text(value.moviesList.message.toString()));
                    case Status.COMPLETED:
                      return ListView.builder(
                          itemCount: value.moviesList.data!.movies!.length,
                          itemBuilder: (context,index){
                            return Card(
                              child: ListTile(

                                leading: Image.network(

                                  value.moviesList.data!.movies![index].posterurl.toString(),
                                  errorBuilder: (context, error, stack){
                                    return Icon(Icons.error, color: Colors.red,);
                                  },
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(value.moviesList.data!.movies![index].title.toString()),
                                subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
                                    Icon(Icons.star , color: Colors.yellow,)
                                  ],
                                ),
                              ),
                            );
                          });

                  }
                  return Container();
                }),
          ) ,
    ));
  }
}
