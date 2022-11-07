import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class sign_up_with_google extends StatefulWidget {
  const sign_up_with_google({Key? key}) : super(key: key);

  @override
  State<sign_up_with_google> createState() => _sign_up_with_googleState();
}
bool showanimation = false;
bool done = false;
class _sign_up_with_googleState extends State<sign_up_with_google> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        setState(() {
          showanimation = true;
        });
        GoogleSignIn _googleSignIn = GoogleSignIn();
        var result = await _googleSignIn.signIn();
        print("//////////////////////////////////////////////////////////////////////");
        print("///////////////////////////////////////////////////////////////////////");
        print(result);
        if(result?.displayName == null){
          setState(() {
            showanimation = false;
            done = false;
          });
        }else{
          setState(() {
            sign_up_controller.user_name.text = "${result?.displayName}";
            sign_up_controller.email.text = "${result?.email}";
            sign_up_controller.password.text = ("${result?.displayName}" + "${result?.email}");
          });
        }
        await _googleSignIn.disconnect();
        setState(() {
          done = true;
        });
      },
      child: AnimatedContainer(
          height: 60,
          width: showanimation? 60 : MediaQuery.of(context).size.width / 1,
          duration: Duration(milliseconds: 1000),
          decoration: BoxDecoration(
          color: showanimation ?Colors.red :Colors.red,
            borderRadius: showanimation ?BorderRadius.all(Radius.circular(60)) :BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 50.0,
                offset: Offset(10,10)
              ),
              BoxShadow(
                  color: Colors.red,
                  blurRadius: 50.0,
                  offset: Offset(-10,-10)
              )
            ]
      ),
      child: showanimation
      ?Center(
        child: done
        ? Icon(MdiIcons.check,color: Colors.white,size: 34,)
        : CircularProgressIndicator(color: Colors.white,)
      )
      :Center(
        child: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width / 3,),
              Icon(MdiIcons.google,color: Colors.white,),
            SizedBox(width: 10,),
            SingleChildScrollView(
                child: Text("GOOGLE",style: GoogleFonts.poppins(letterSpacing: 2,color: Colors.white),))
          ],
        ),
      ),
      ),
    );
  }
}
