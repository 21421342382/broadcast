import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:broadcast/controllers/sign%20up%20controller.dart';


class sign_up_text_required extends StatefulWidget {
  const sign_up_text_required({Key? key}) : super(key: key);

  @override
  State<sign_up_text_required> createState() => _sign_up_text_requiredState();
}

class _sign_up_text_requiredState extends State<sign_up_text_required> {
  @override
  bool show = true ;
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 2), (timer) {//get current date and time
        if(sign_up_controller.user_name.text == ""){
          setState(() {
            show = true ;
          });
        }else{
          if(sign_up_controller.email.text == ""){
            setState(() {
              show = true ;
            });
          }else{
            if(sign_up_controller.password.text == ""){
              setState(() {
                show = true ;
              });
            }else{
              if(sign_up_controller.has_image == false){
                setState(() {
                  show = true;
                });
              }else{
                setState(() {
                  show = false ;
                });
              }
            }
            }
        }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        show ?Text("Required *",style: GoogleFonts.poppins(color: Colors.red,fontSize: 12),): Text("")
      ],
    );
  }
}
