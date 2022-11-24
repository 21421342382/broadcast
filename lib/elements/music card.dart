import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:broadcast/audio/audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class music_card extends StatefulWidget {
  const music_card({Key? key}) : super(key: key);

  @override
  State<music_card> createState() => _music_cardState();
}

class _music_cardState extends State<music_card> {
  @override

  bool play_pause = false;
  final audio_player = AudioPlayer();
  var progress ;
  var buffer_progress ;
  var duration ;


  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                            if(play_pause == true) {
                              var yt = YoutubeExplode();
                              var manifest = await yt.videos.streamsClient.getManifest("https://www.youtube.com/watch?v=y2tEPmwWEiI");
                              var streamInfo = manifest.audioOnly.withHighestBitrate();
                              var stream = yt.videos.streamsClient.get(streamInfo);
                              audio_player.setUrl(streamInfo.url.toString());
                              audio_player.play();
                              setState(() {
                                progress = audio_player.duration;
                                buffer_progress = audio_player.bufferedPosition;
                                duration = audio_player.duration ?? Duration.zero ;
                              });
                              Timer.periodic(Duration(seconds: 1), (Timer t) => {
                              setState(() {
                              progress = audio_player.position;
                              buffer_progress = audio_player.bufferedPosition;
                              duration = audio_player.duration ?? Duration.zero ;
                              play_pause = audio_player.playing ;
                              })
                              });
                            }else if(play_pause == false){
                              audio_player.pause();
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18,right: 18),
          child: ProgressBar(
          progress: progress == null ?audio_player.position : progress,
          buffered: buffer_progress == null ?audio_player.bufferedPosition : buffer_progress,
            total: duration == null ?audio_player.duration ?? Duration.zero : duration,
            progressBarColor: Colors.red,
            baseBarColor: Colors.black87.withOpacity(0.24),
            bufferedBarColor: Colors.black87.withOpacity(0.24),
            thumbColor: Colors.black87,
            barHeight: 3.0,
            thumbRadius: 5.0,
            onSeek: (duration) {
            setState(() {
              audio_player.seek(duration);
            });
            },
            ),
        )
      ],
    );
  }
}
