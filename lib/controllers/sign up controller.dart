import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../main page/main page.dart';

class sign_up_controller{

  static var image_user ;
  static TextEditingController user_name = new TextEditingController() ;
  static TextEditingController email = new TextEditingController();
  static TextEditingController password = new TextEditingController();
  static bool has_image = false;
  static bool image_type_net = false;
  /////////////////////////////// INTREST /////////////////////////////////
  static bool tech = false;
  static bool gaming = false;
  static bool funny = false;
  static bool music = false;
  static bool news = false;
  static bool programming = false;
  static bool art = false;
  static bool anime = false;
  static bool handicraft = false;
  static var number_of_intrest = 0;
  //////////////////////////////// BOX 1 & BOX 2 ///////////////////////////////////////
  static bool box1 = false;
  static bool box2 = false;

  static create_account(context)async{
    final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
    await conn_url.open();
    var coll = conn_url.collection('accounts');
    var accounts = await coll.find().toList();
    print(accounts);
    await coll.insert(
        {'name': '${user_name.text}',
          'email': '${email.text}',
          'password': '${password.text}',
          'profile' : '${image_user}',
          'tech' : '${tech}',
          'gaming' : '${gaming}',
          'funny' : '${funny}',
          'news' : '${news}',
          'programming' : '${programming}',
          'art' : '${art}',
          'anime' : '${anime}',
          'handicraft' : '${handicraft}'
        });
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Main_Page()), (route) => false);

  }

}