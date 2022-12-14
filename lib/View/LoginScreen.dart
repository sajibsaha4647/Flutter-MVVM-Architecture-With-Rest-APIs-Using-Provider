import 'package:flutter/material.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/Utils/Utils.dart';
import 'package:fluttermvvm/ViewModel/AuthViewmodel/AuthViewModel.dart';
import 'package:provider/provider.dart';
import '../res/Components/RoundButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailcontrol = TextEditingController();
  TextEditingController _passwordcontrol = TextEditingController();

  FocusNode emailfocus = FocusNode();
  FocusNode passwordfocus = FocusNode();

  bool _isObscure = true;



  @override
  Widget build(BuildContext context) {

    final authviewmodel = Provider.of<AuthViewmodel>(context) ;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
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
                        icon: const Icon(
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
                        icon: const Icon(
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
                RoundButton(title: 'Login',onPress: (){
                  Map data = {
                    "email":_emailcontrol.text.toString(),
                    "password": _passwordcontrol.text.toString(),
                  };
                  authviewmodel.LoginProcess(data,context);
                }, loading: authviewmodel.loading,),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RoutesName.signup);
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
