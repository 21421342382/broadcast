import 'package:broadcast/elements/sign%20up%20user%20name.dart';
import 'package:broadcast/elements/sign%20up%20user%20pasword.dart';
import 'package:broadcast/elements/sign%20up%20with%20email%20box.dart';
import 'package:broadcast/elements/sign%20up%20with%20facebook.dart';
import 'package:broadcast/elements/sign%20up%20with%20google.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logo box.dart';

class sign_up_1_box extends StatefulWidget {
  const sign_up_1_box({Key? key}) : super(key: key);

  @override
  State<sign_up_1_box> createState() => _sign_up_1_boxState();
}

class _sign_up_1_boxState extends State<sign_up_1_box> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            logo_sign_up_box(),
            SizedBox(width: 10,),
            sign_up_user_name(),

          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(width: 10,),
            sign_up_with_email_box(),
            sign_up_user_password()
          ],
        ),
        SizedBox(height: 20,),
        Text("or autofill deatils usign :",style: GoogleFonts.poppins(color: Colors.grey),),
        SizedBox(height: 40,),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: sign_up_with_google(),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: sign_up_with_facebook(),
            )
          ],
        )
      ],
    );
  }
}
