import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class intrest_box extends StatefulWidget {
  intrest_box({Key? key, this.width, this.text , required this.intrest_type}) : super(key: key);
final width ;
final text ;
var intrest_type ;
  @override
  State<intrest_box> createState() => _intrest_boxState();
}

class _intrest_boxState extends State<intrest_box> {
  @override
  bool show_animation = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          show_animation = !show_animation;
          widget.intrest_type = true;
          sign_up_controller.number_of_intrest = sign_up_controller.number_of_intrest + 1;
        });
        print(widget.intrest_type);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: 25,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          border: Border.all(color: show_animation ?Colors.transparent :Colors.grey),
          color: show_animation ? Colors.greenAccent : Colors.transparent
        ),
        child: Center(child: Text(widget.text,
          style: GoogleFonts.poppins(color: show_animation ?Colors.grey :Colors.grey),),),
      ),
    );
  }
}
