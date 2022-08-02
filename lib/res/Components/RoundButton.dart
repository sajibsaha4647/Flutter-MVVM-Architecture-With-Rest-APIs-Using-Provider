import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttermvvm/res/Colors.dart';

class RoundButton extends StatefulWidget {

  late final String title ;
  late final bool loading ;
  late final VoidCallback onPress ;


  RoundButton({Key?key, required this.title, this.loading = false, required this.onPress }) : super(key:key);

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.blackcolor
        ),
        child: widget.loading ? CircularProgressIndicator() :  Text(widget.title,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
