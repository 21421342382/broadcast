import 'package:broadcast/account%20page/account%20page.dart';
import 'package:broadcast/add%20new/add%20new.dart';
import 'package:broadcast/broadcast/broadcast.dart';
import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:awesome_bottom_navigation/awesome_bottom_navigation.dart';
import 'package:broadcast/elements/music%20card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:broadcast/main%20page/news%20section.dart';
import 'package:flutter/material.dart';
import '../audio/audio.dart';
import '../elements/main page news card.dart';
import '../elements/main page top.dart';
import '../elements/something went wrong.dart';
import 'main page shimmer loader.dart';

class Main_Page extends StatefulWidget {
  Main_Page({Key? key}) : super(key: key);

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {

  var index_number = 0;
  final pages = [
    news_section(),
    broadcast(),
    add_new(),
    audio(),
    account_page()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          main_page_top(),
          Expanded(child: pages[index_number]),
          // main_page_bottom()
      Container(
          height: 60,
          child: AwesomeBottomNav(
            icons: [
              MdiIcons.newspaperVariantMultiple ,
              MdiIcons.broadcast,
              MdiIcons.plusCircle,
              Icons.audiotrack_outlined,
              MdiIcons.accountCircleOutline
              // Icons.settings_outlined,
            ],
            highlightedIcons: [
              MdiIcons.newspaper,
              MdiIcons.broadcast,
              MdiIcons.plusCircle,
              Icons.audiotrack,
              Icons.account_circle,
              // Icons.settings,
            ],
            onTapped: (int value) {
              setState(() {
                audio_player.pause();
                index_number = value ;
              });
            },
            bodyBgColor: Colors.black45,
            highlightColor: Color(0xFFFF9944),
            navFgColor: Colors.white,
            navBgColor: Color(0xFFFF9944),
          )
      )
        ],
      ),

    );
  }
}
