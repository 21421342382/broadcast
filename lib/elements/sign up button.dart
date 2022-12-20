import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../main page/main page.dart';

class sign_up_button extends StatefulWidget {
  const sign_up_button({Key? key}) : super(key: key);

  @override
  State<sign_up_button> createState() => _sign_up_buttonState();
}

class _sign_up_buttonState extends State<sign_up_button> {
  @override
  bool show_spinner = false;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: GestureDetector(
        onTap: () async {
          if(show_spinner == true){

          }else{
            if (sign_up_controller.box1 == true) {
              if (sign_up_controller.box2 == true) {
                setState(() {
                  show_spinner = true;
                });
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString("email", "${sign_up_controller.email.text}");
                prefs.setString(
                    "password", "${sign_up_controller.password.text}");
                prefs.setString("name", "${sign_up_controller.user_name.text}");
                if (sign_up_controller.has_image == true) {
                  prefs.setString("image", "${sign_up_controller.image_user}");
                } else {
                  prefs.setString("image", "null");
                }
                prefs.setString("LoggedIn", "true");
                prefs.setString("email", "${sign_up_controller.email.text}");
                print("Done");
                sign_up_controller.create_account(context);
              } else {
                showTopSnackBar(
                  context,
                  CustomSnackBar.error(
                    message: "Something went wrong. Intrest can't be empty",
                  ),
                );
              }
            } else {
              showTopSnackBar(
                context,
                CustomSnackBar.error(
                  message:
                  "Something went wrong. Please check your credentials and try again",
                ),
              );
            }
          }
        },
        child: Container(
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFFF1B1B)),
          child: Center(
            child: show_spinner
                ? SpinKitSpinningLines(
                    color: Colors.white,
                    size: 50.0,
                  )
                : Text(
                    "SIGN UP",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontSize: 20, letterSpacing: 3),
                  ),
          ),
        ),
      ),
    );
  }
}
