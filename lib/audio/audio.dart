import 'package:broadcast/audio/other_music.dart';
import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../broadcast/Broadcast Shimmer.dart';
import '../elements/music card.dart';
import '../elements/something went wrong.dart';

class audio extends StatelessWidget {
  const audio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main_page_controller.load_music(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return broadcast_shimmer();
          }else if(snapshot.hasError){
            return something_with_wrong();
          }else{
            return Column(
              children: [
                music_card(
                    title: snapshot.data[0]["title"],
                    author: snapshot.data[0]["author"],
                    thumbnail: snapshot.data[0]["thumbnail"],
                    url: snapshot.data[0]["url"]),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 6,),
                    Text("Other",style: GoogleFonts.poppins(color: Colors.grey,fontSize: 16),),
                    SizedBox(width: 8,),
                    Expanded(child: Divider(color: Colors.grey,)),
                    SizedBox(width: 8,)
                  ],
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context , int index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: other_music_card(
                          title: snapshot.data[index.toInt()]["title"],
                          author: snapshot.data[index.toInt()]["author"],
                          thumbnail: snapshot.data[index.toInt()]["thumbnail"],
                          url: snapshot.data[index.toInt()]["url"],
                        ),
                      );
                    }),
                  ),
                )
              ],
            );
          }
        });
  }
}
