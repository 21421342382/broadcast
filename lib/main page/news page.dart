import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class new_page extends StatelessWidget {
  new_page({Key? key, required this.image, required this.title, required this.description, required this.url}) : super(key: key);
final image ;
final title ;
final description ;
final url ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5,),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 100,
              child:ClipRRect(
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  height: 150.0,
                  width: 100.0,
                ),
              )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,style: GoogleFonts.poppins(fontSize: 18),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description,style: GoogleFonts.poppins(fontSize: 15),),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: ()async{
                final _url = Uri.parse(url) ;
                if (!await launchUrl(_url)) {
                  throw 'Could not launch $_url';
                }
              },
              child: Container(
                child: RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: "More info - ",style: GoogleFonts.poppins(fontSize: 15,color: Colors.black)),
                      TextSpan(text: '$url', style: GoogleFonts.poppins(fontSize: 15,color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
          ),



          ],
        ),
      ),
    );
  }
}
