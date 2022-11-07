import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../elements/main page news card.dart';
import '../elements/something went wrong.dart';
import 'main page shimmer loader.dart';

class news_section extends StatelessWidget {
  const news_section({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main_page_controller.load_news(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Main_Page_shimmer();
          }else if(snapshot.hasError){
            return something_with_wrong();
          }else{
            return Container(
                color: Colors.white,
                child: Container(
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return main_page_news_card(
                          image: snapshot.data[index.toInt()]["image url"],
                          text: snapshot.data[index.toInt()]["title"],
                          description: snapshot.data[index.toInt()]["description"],
                          url: snapshot.data[index.toInt()]["url"],
                        );
                      }),
                )
            );
          }
        });
  }
}
