import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:broadcast/main%20page/main%20page.dart';
import 'package:broadcast/main%20page/news%20section.dart';
import 'package:broadcast/main.dart';
import 'package:broadcast/registration/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:broadcast/assets%20controller/assets%20controller.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  check_user_loggedin(){
    Future.delayed(Duration(seconds: 5),()async{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Main_Page()));
    });
  }

  Widget build(BuildContext context) {
    check_user_loggedin();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Image(
            image: AssetImage(assets_controller.logo),
          ),
        ),
      ),
    );
  }
}
