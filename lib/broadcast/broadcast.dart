import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Broadcast Shimmer.dart';
import '../elements/main page news card.dart';
import '../elements/something went wrong.dart';
import 'broadcast live news card.dart';

class broadcast extends StatefulWidget {
  broadcast({Key? key}) : super(key: key);

  @override
  State<broadcast> createState() => _broadcastState();
}

class _broadcastState extends State<broadcast> {
  @override

  final option = [
    broadcast_youtube(),
    broadcast_live(),
  ];

  bool youtube_live = false;
  int index = 1;

  bool broadcast_live_ = true;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        youtube_live = true;
                        broadcast_live_ = false;
                        index = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1/2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: youtube_live ? Colors.red.shade900 :null,
                        border: youtube_live
                        ? null
                        : Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Youtube Live",style: GoogleFonts.poppins(color: youtube_live ?Colors.white :Colors.grey),),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      broadcast_live_ = true;
                      youtube_live = false;
                      index = 1;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 1/2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: broadcast_live_ ? Colors.red.shade900 :null,
                        border: broadcast_live_
                            ? null
                            : Border.all(color: Colors.grey)
                    ),
                    child: Center(
                      child: Text("Broadcast Live",style: GoogleFonts.poppins(color: broadcast_live_ ?Colors.white :Colors.grey),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: option[index])
      ],
    );
  }
}

class broadcast_youtube extends StatefulWidget {
  const broadcast_youtube({Key? key}) : super(key: key);

  @override
  State<broadcast_youtube> createState() => _broadcast_youtubeState();
}

class _broadcast_youtubeState extends State<broadcast_youtube> {
  @override

  bool reinitiliase_container = false;


  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main_page_controller.load_live_news(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return broadcast_shimmer();
          }else if(snapshot.hasError){
            return something_with_wrong();
          }else{
            if(main_page_controller.url == null){
              main_page_controller.url = snapshot.data[0]["link"];
              main_page_controller.title = snapshot.data[0]["title"];
              main_page_controller.photo = snapshot.data[0]["channel photo"];
            }
            return Column(
              children: [
                reinitiliase_container
                ?Container()
                :broadcast_live_news_card(
                  url: main_page_controller.url,
                  title: main_page_controller.title,
                  photo_url: main_page_controller.photo,
                ),
                Divider(color: Colors.grey,),
                Expanded(
                  child:
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            main_page_controller.url = snapshot.data[index.toInt()]["link"];
                            main_page_controller.title = snapshot.data[index.toInt()]["title"];
                            main_page_controller.photo = snapshot.data[index.toInt()]["channel photo"];
                            reinitiliase_container = true;
                            reinitiliase_container = false;
                          });
                        },
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(60)),
                                      child : Image.network(snapshot.data[index.toInt()]["channel photo"])
                                  ),
                                  SizedBox(width: 10,),
                                  Text("${snapshot.data[index.toInt()]["title"]}",
                                    textDirection: TextDirection.ltr,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(color: Colors.black,),),
                                  Expanded(child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.play_circle_fill,color: Colors.green,)))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                )
              ],
            );
          }
        });
  }
}

class broadcast_live extends StatelessWidget {
  const broadcast_live({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

