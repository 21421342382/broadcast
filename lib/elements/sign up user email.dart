import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sign_up_user_email extends StatelessWidget {
  const sign_up_user_email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              border: Border.all(color: Colors.grey)
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              cursorColor: Colors.grey,
              style: GoogleFonts.poppins(),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter Email"),
            ),
          ),
        ),
      ),
    );
  }
}
