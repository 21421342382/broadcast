import 'package:broadcast/assets%20controller/assets%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class broadcast_live_news_card extends StatefulWidget {
  broadcast_live_news_card({Key? key, required this.url, required this.photo_url, required this.title}) : super(key: key);
  final url ;
  final photo_url ;
  final title ;

  @override
  State<broadcast_live_news_card> createState() => _broadcast_live_news_cardState();
}

class _broadcast_live_news_cardState extends State<broadcast_live_news_card> {
  @override
  late YoutubePlayerController controller ;
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          isLive: true,
          forceHD: false,
          showLiveFullscreenButton: false,
        )
    );

  }



  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context , player){
          return Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 20),
            child: Column(
              children: [
                GestureDetector(
                  // onTap: (){
                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => new_page(image: image,title: text,description: description,url: url,)));
                  // },
                  child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),

                      ),
                      child:Stack(
                        children: <Widget>[
                          Center(child: Image.asset(assets_controller.loader)),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: player
                          ),

                        ],
                      )


                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${widget.photo_url}")
                          )
                      ),
                      // child: player.,
                    ),
                    SizedBox(width: 15,),

                    SizedBox(width: 15,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${widget.title}",textDirection: TextDirection.ltr,
                                  style: GoogleFonts.poppins(),
                                  maxLines: 3,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => broadcast_live_news_full_screen_video_player(url: widget.url)));
                          },
                          child: Icon(Icons.screen_rotation,color: Colors.grey,)),
                    ),
                    SizedBox(width: 18,)
                  ],
                ),
              ],
            ),
          );
        });

  }
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller.dispose();
  }
}

class broadcast_live_news_full_screen_video_player extends StatefulWidget {
  broadcast_live_news_full_screen_video_player({Key? key, required this.url}) : super(key: key);
  final url ;
  @override
  State<broadcast_live_news_full_screen_video_player> createState() => _broadcast_live_news_full_screen_video_playerState();
}

class _broadcast_live_news_full_screen_video_playerState extends State<broadcast_live_news_full_screen_video_player> {
  @override
  late YoutubePlayerController controller ;


  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          isLive: true,
          forceHD: true,
          showLiveFullscreenButton: false,
        )
    );

  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
              ),
              builder: (context , player) {
                return Container();
              }
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: (){
                  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((value) => {
                    Navigator.pop(context)
                  });

                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.all(Radius.circular(60))
                    ),
                    child: Center(child: Icon(Icons.crop_rotate_rounded,color: Colors.black87,))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
