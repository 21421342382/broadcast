import 'package:broadcast/assets%20controller/assets%20controller.dart';
import 'package:broadcast/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class something_with_wrong extends StatelessWidget {
  const something_with_wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    child: Image(
                      image: AssetImage(assets_controller.somethng_went_wrong),
                    ),
                  ),
                  Text("Oops ! Something went wrong, Please try again later ",style: GoogleFonts.poppins(color: Colors.grey),),
                  SizedBox(height: 100,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => main_page()), (route) => false);
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(60))
                      ),
                      child: Center(
                        child: Text("Try Again !",style: GoogleFonts.poppins(color: Colors.white),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
