import 'package:broadcast/splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const main_page());
}
class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : splash()
    );
  }
}
