import 'package:broadcast/audio/audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class music_card extends StatefulWidget {
  const music_card({Key? key}) : super(key: key);

  @override
  State<music_card> createState() => _music_cardState();
}

class _music_cardState extends State<music_card> {
  @override

  bool play_pause = false;
  final audio_player = AudioPlayer();

  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10,),
      Container(
      height: 170,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Image.network("https://a10.gaanacdn.com/images/albums/48/2455848/crop_480x480_2455848.jpg",fit: BoxFit.fill,),

        ),
      ),
    ),
        SizedBox(width: 10,),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text("Sugar & Brownies",style: GoogleFonts.poppins(color: Colors.black87),),
              Text("Dharia",style: GoogleFonts.poppins(color: Colors.grey),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Icon(Icons.arrow_left_outlined,color: Colors.grey,size: 44,),
                  InkWell(
                      onTap: ()async{
                        setState(() {
                          play_pause = !play_pause;
                        });
                        if(play_pause == true){
                          final duration = await audio_player.setUrl(           // Load a URL
                              'https://foo.com/bar.mp3');                 // Schemes: (https: | file: | asset: )
                          audio_player.play();
                        }
                      },
                      child: play_pause
                      ?Icon(Icons.pause,color: Colors.grey,size: 54,)
                      :Icon(Icons.play_circle_fill,color: Colors.blue,size: 54,)),
                  Icon(Icons.arrow_right_outlined,color: Colors.grey,size: 44,),

                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
