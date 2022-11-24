import 'package:broadcast/elements/music%20card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class other_music_card extends StatefulWidget {
  other_music_card({Key? key, required this.title, required this.author, required this.thumbnail, required this.url}) : super(key: key);
  final title ;
  final author ;
  final thumbnail ;
  final url ;
  @override
  State<other_music_card> createState() => _other_music_cardState();
}

class _other_music_cardState extends State<other_music_card> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        music_card_state.setState(() {
          music_card_state.widget.title = widget.title;
          music_card_state.widget.author = widget.author;
          music_card_state.widget.thumbnail = widget.thumbnail;
          music_card_state.widget.url = widget.url;
          music_card_state.audio_player.pause();
          music_card_state.play_pause = false;
        });
      },
      child: Column(
        children: [
          Container(
            height: 180,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.black87
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(widget.thumbnail,fit: BoxFit.fitHeight,),
            ),
          ),
          Container(
            width: 140,
            child: Text("${widget.title}",style: GoogleFonts.poppins(),overflow: TextOverflow.ellipsis,),
          ),
          Text("${widget.author}",style: GoogleFonts.poppins(color: Colors.grey),),

        ],
      ),
    );
  }
}
