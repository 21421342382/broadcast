import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:broadcast/controllers/sign%20up%20controller.dart';


class sign_up_with_facebook extends StatefulWidget {
  const sign_up_with_facebook({Key? key}) : super(key: key);

  @override
  State<sign_up_with_facebook> createState() => _sign_up_with_facebookState();
}

class _sign_up_with_facebookState extends State<sign_up_with_facebook> {
  bool showanimation = false;
  bool done = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        setState(() {
          showanimation = !showanimation;
        });
        print("FaceBook");
        try {
          final result =
              await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
          if (result.status == LoginStatus.success) {
            final userData = await FacebookAuth.i.getUserData();
            print(userData);
            setState(() {
              sign_up_controller.user_name.text = "${userData["name"]}";
              sign_up_controller.email.text = "${userData["email"]}";
              sign_up_controller.password.text = ("${userData["name"]}" + "${userData["email"]}");
            });
          }
          await FacebookAuth.i.logOut();
          setState(() {
            done = true;
          });
        } catch (error) {
          print(error);
        }

      },
      child: AnimatedContainer(
        height: 60,
        width: showanimation? 60 : MediaQuery.of(context).size.width / 1,
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
            color: showanimation ?Colors.blue :Colors.blueAccent,
            borderRadius: showanimation ?BorderRadius.all(Radius.circular(60)) :BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue,
                  blurRadius: 50.0,
                  offset: Offset(10,10)
              ),
              BoxShadow(
                  color: Colors.blue,
                  blurRadius: 50.0,
                  offset: Offset(-10,-10)
              )
            ]
        ),
        child: showanimation
            ?Center(
          child: done
          ? Icon(MdiIcons.check,color: Colors.white,size: 34,)
          : CircularProgressIndicator(color: Colors.white,),
        )
            :Center(
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width / 3,),
              Icon(MdiIcons.facebook,color: Colors.white,),
              SizedBox(width: 10,),
              Text("FACEBOOK",style: GoogleFonts.poppins(letterSpacing: 2,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
