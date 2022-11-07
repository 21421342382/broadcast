import 'dart:async';
import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class sign_up_details_verfier extends StatefulWidget {
  const sign_up_details_verfier({Key? key}) : super(key: key);

  @override
  State<sign_up_details_verfier> createState() => _sign_up_details_verfierState();
}

class _sign_up_details_verfierState extends State<sign_up_details_verfier> {

  @override
  bool color = true ;

  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 2), (timer) {//get current date and time
        if(sign_up_controller.user_name.text == ""){
          setState(() {
            color = true ;
          });
        }else{
          if(sign_up_controller.email.text == ""){
            setState(() {
              color = true ;
            });
          }else{
            if(sign_up_controller.password.text == ""){
              setState(() {
                color = true ;
              });
            }else {
                setState(() {
                  color = false;
                  sign_up_controller.box1 = true;
                });
              }
          }
      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2)),
          color: color ? Colors.redAccent : Colors.green
        ),
    );
  }
}
