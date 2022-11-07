import 'package:broadcast/elements/sign%20up%20details%20verifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../elements/sign up 2 box.dart';
import '../elements/sign up button.dart';
import '../elements/sign up verifier.dart';
import '../elements/sign_up_1_box.dart';

class sign_up extends StatelessWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Center(child: Text("Sign up to continue",style: GoogleFonts.poppins(letterSpacing: 4.5),),),
            SizedBox(height: 20,),
            sign_up_details_verfier(),
            sign_up_text_required(),
            SizedBox(height: 20,),
            sign_up_1_box(),
            SizedBox(height: 40,),
            sign_up_2_box(),
            SizedBox(height: 20,),
            sign_up_button(),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
