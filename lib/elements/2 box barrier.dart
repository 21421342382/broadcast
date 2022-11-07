import 'dart:async';

import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/material.dart';

class box_barrier_2 extends StatefulWidget {
  const box_barrier_2({Key? key}) : super(key: key);

  @override
  State<box_barrier_2> createState() => _box_barrier_2State();
}

class _box_barrier_2State extends State<box_barrier_2> {
  @override
  bool color = true ;
  void initState() {
    Timer mytimer = Timer.periodic(Duration(seconds: 2), (timer) {//get current date and time
      if(sign_up_controller.number_of_intrest == 0){
        setState(() {
          color = true;
          sign_up_controller.box2 = true;
        });
      }else{
        setState(() {
          color = false;
        });
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
