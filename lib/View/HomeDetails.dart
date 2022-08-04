import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/HomeViewModel/HomeViewModel.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({Key? key,}) : super(key: key);

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {



  @override
  Widget build(BuildContext context) {
    final homeviewmodels = Provider.of<HomeViewModel>(context, listen: true);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("homw details"),
      ),
      body: Container(
        child: Text(homeviewmodels.userdata.data!.data!.email
            .toString()),
      ),
    ));
  }
}
