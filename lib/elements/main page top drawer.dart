import 'package:broadcast/assets%20controller/assets%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class main_page_top_drawer extends StatefulWidget {
  const main_page_top_drawer({Key? key}) : super(key: key);

  @override
  State<main_page_top_drawer> createState() => _main_page_top_drawerState();
}

class _main_page_top_drawerState extends State<main_page_top_drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60))
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(assets_controller.drawer_gif),
      ),
    );
  }
}
