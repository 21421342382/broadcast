import 'package:broadcast/assets%20controller/assets%20controller.dart';
import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:broadcast/main%20page/news%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class main_page_news_card extends StatelessWidget {
  main_page_news_card({Key? key, required this.image, required this.text, required this.description, required this.url}) : super(key: key);
final image ;
final text ;
final description ;
final url ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8,bottom: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => new_page(image: image,title: text,description: description,url: url,)));
            },
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
                    child: Image.network(
                        image,
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ],
              )


            ),
          ),
          Row(
            children: [
              SizedBox(width: 5,),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  main_page_controller.like_button_controller(context);
                  return Icon(
                    MdiIcons.heartCircleOutline,
                    color: isLiked ? Colors.orangeAccent : Colors.blueGrey,
                    size: 40,
                  );
                  },

              ),
              SizedBox(width: 15,),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  main_page_controller.like_button_controller(context);
                  return Icon(
                    MdiIcons.commentAccountOutline,
                    color: isLiked ? Colors.orangeAccent : Colors.blueGrey,
                    size: 40,
                  );
                },
              ),
              SizedBox(width: 15,),
              LikeButton(
                likeBuilder: (bool isLiked) {
                  main_page_controller.like_button_controller(context);
                  return Icon(
                    MdiIcons.starBoxOutline,
                    color: isLiked ? Colors.orangeAccent : Colors.blueGrey,
                    size: 40,
                  );
                },
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    children: [
                      Container(
                        height: 65,
                        child: Center(
                          child: Text(
                            "${text}",textDirection: TextDirection.ltr,
                            style: GoogleFonts.poppins(),
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
