import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class audio_shimmer extends StatelessWidget {
  const audio_shimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1600,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.shade300
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),


                  ),
                ),
                SizedBox(width: 10,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Container(
                          width: 140,
                        height: 10,
                        color: Colors.grey.shade300,
                    ),
                      SizedBox(height: 10,),
                      Container(
                        width: 60,
                        height: 7,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.arrow_left_outlined,color: Colors.grey.shade300,size: 44,),

                    Icon(Icons.play_circle_fill,color: Colors.grey.shade300,size: 54,),
                          Icon(Icons.arrow_right_outlined,color: Colors.grey.shade300,size: 44,),

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 18,right: 18),
              child: ProgressBar(
                progress: Duration.zero,
                buffered: Duration.zero,
                total: Duration.zero,
                timeLabelTextStyle: GoogleFonts.poppins(color: Colors.grey.shade300),
                progressBarColor: Colors.grey.shade300,
                baseBarColor: Colors.grey.shade300,
                bufferedBarColor: Colors.grey.shade300,
                thumbColor: Colors.grey.shade300,
                barHeight: 3.0,
                thumbRadius: 5.0,
                onSeek: (duration) {

                },
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text("Hip Hop",style: GoogleFonts.poppins(color: Colors.grey.shade300),),
                Expanded(child: Divider(color: Colors.grey.shade300,))
              ],
            ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.grey.shade300
                            )),
                        SizedBox(height: 10,),
                        Container(
                          width: 140,
                          height: 10,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 60,
                          height: 7,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text("Old Memories",style: GoogleFonts.poppins(color: Colors.grey.shade300),),
                Expanded(child: Divider(color: Colors.grey.shade300,))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.shade300
                              )),
                          SizedBox(height: 10,),
                          Container(
                            width: 140,
                            height: 10,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 60,
                            height: 7,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text("Bollywood",style: GoogleFonts.poppins(color: Colors.grey.shade300),),
                Expanded(child: Divider(color: Colors.grey.shade300,))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.shade300
                              )),
                          SizedBox(height: 10,),
                          Container(
                            width: 140,
                            height: 10,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 60,
                            height: 7,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text("Hollywood",style: GoogleFonts.poppins(color: Colors.grey.shade300),),
                Expanded(child: Divider(color: Colors.grey.shade300,))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.shade300
                              )),
                          SizedBox(height: 10,),
                          Container(
                            width: 140,
                            height: 10,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 60,
                            height: 7,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8,),
                Text("Tollywood",style: GoogleFonts.poppins(color: Colors.grey.shade300),),
                Expanded(child: Divider(color: Colors.grey.shade300,))
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                              height: 180,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  color: Colors.grey.shade300
                              )),
                          SizedBox(height: 10,),
                          Container(
                            width: 140,
                            height: 10,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            width: 60,
                            height: 7,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
