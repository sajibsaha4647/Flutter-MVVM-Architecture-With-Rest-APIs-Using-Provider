import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Utils.dart';

import '../Utils/Routes/RoutesName.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontrol = TextEditingController();
  TextEditingController _passwordcontrol = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Login screen"),
            ),
            body: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  TextFormField(
                    controller: _emailcontrol,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "email address"   ,
                         labelText:"email",
                        prefixIcon: Icon(Icons.email),
                    ),
                  ),
                SizedBox(height: 20,),
                TextFormField(
                  onTap: () {},
                  obscureText: _isObscure,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.start,
                  controller: _passwordcontrol,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    label: Text("password"),
                    suffixIcon: _isObscure == true
                        ? IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = false;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye,
                          size: 20,
                          color: Colors.black,
                        ))
                        : IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = true;
                          });
                        },
                        icon: Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.black,
                        )),
                    hintText: "password",
                    alignLabelWithHint: true,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF414041),
                    ),
                  ),
                ),
              ],
            ),
                )
            )
        )
    );
  }
}
