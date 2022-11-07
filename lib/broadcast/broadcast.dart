import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Broadcast Shimmer.dart';
import '../elements/main page news card.dart';
import '../elements/something went wrong.dart';
import 'broadcast live news card.dart';

class broadcast extends StatelessWidget {
  const broadcast({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main_page_controller.load_live_news(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return broadcast_shimmer();
          }else if(snapshot.hasError){
            return something_with_wrong();
          }else{

            return Container(
                color: Colors.white,
                child: Container(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return broadcast_live_news_card(
                          url: snapshot.data[index.toInt()]["link"],
                          title: snapshot.data[index.toInt()]["title"],
                          photo_url: snapshot.data[index.toInt()]["channel photo"],
                        );
                      }),
                )
            );
          }
        });
  }
}
