import 'package:flutter/material.dart';

import '../Utils/Utils.dart';
import '../res/Components/RoundButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  TextEditingController _emailcontrol = TextEditingController();
  TextEditingController _passwordcontrol = TextEditingController();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Signup pages"),),
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
                    focusNode: emailfocus,
                    onFieldSubmitted: (value){
                      Utils.fiedlFocuschange(context, emailfocus,passwordfocus);
                    },
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
                    focusNode: passwordfocus,
                    textAlignVertical: TextAlignVertical.top,
                    obscuringCharacter: "*",
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
                  SizedBox(height: 20,),
                  RoundButton(title: 'Signup',onPress: (){
                    Map data = {
                      "email":_emailcontrol.text,
                      "password": _passwordcontrol.text,
                    };
                  }, loading: false),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){

                    },
                    child: Text("Don't have an account ? Signup "),
                  )
                ],
              ),
            )
        )
    )
    );

  }
}
