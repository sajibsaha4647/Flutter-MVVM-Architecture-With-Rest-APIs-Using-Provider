import 'package:flutter/material.dart';

import '../ViewModel/ViewServices/SplashViewServices.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  SplashViewServices splashViewServices = SplashViewServices() ;

  @override
  void initState() {
    splashViewServices.checkAuthenticationService(context) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Text("Splash screen"),
      ),
    ));
  }
}
