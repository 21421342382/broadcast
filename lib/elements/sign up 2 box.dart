import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '2 box barrier.dart';
import 'intrestbox.dart';

class sign_up_2_box extends StatelessWidget {
  const sign_up_2_box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        box_barrier_2(),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Choose your intrest",
                style: GoogleFonts.poppins(color: Colors.grey,fontSize: 17),)),
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            SizedBox(width: 18,),
            intrest_box(width: 80.0,text: "TECH",intrest_type: sign_up_controller.tech,),
            SizedBox(width: 20,),
            intrest_box(width: 100.0,text: "GAMING",intrest_type: sign_up_controller.gaming,),
            SizedBox(width: 20,),
            intrest_box(width: 90.0,text: "FUNNY",intrest_type: sign_up_controller.funny,),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            SizedBox(width: 40,),
            intrest_box(width: 90.0,text: "MUSIC",intrest_type: sign_up_controller.music,),
            SizedBox(width: 20,),
            intrest_box(width: 80.0,text: "NEWS",intrest_type: sign_up_controller.news,),
            SizedBox(width: 20,),
            intrest_box(width: 150.0,text: "PROGRAMMING", intrest_type: sign_up_controller.programming,),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            SizedBox(width: 5,),
            intrest_box(width: 80.0,text: "ART",intrest_type: sign_up_controller.art,),
            SizedBox(width: 20,),
            intrest_box(width: 90.0,text: "ANIME",intrest_type: sign_up_controller.anime,),
            SizedBox(width: 20,),
            intrest_box(width: 150.0,text: "HANDICRAFT", intrest_type: sign_up_controller.handicraft,),
          ],
        )
      ],
    );
  }
}
