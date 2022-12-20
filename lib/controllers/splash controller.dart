import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main page/main page.dart';
import 'main page controller.dart';

class splash_controller{
  static update_values(context)async{
    final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
    await conn_url.open();
    var coll = conn_url.collection('news_feed');
    var news = await coll.find().toList();
    print(news.length);
    main_page_controller.data_loaded = true;
    main_page_controller.news = news;
    ////////////////////////////////////
    var coll2 = conn_url.collection('live_news');
    var news2 = await coll2.find().toList();
    print(news2.length);
    main_page_controller.loaded_live_news = true;
    main_page_controller.live_news = news2;
    print(main_page_controller.live_news.length);
    ///////////////////////////////////////////
    var coll3 = conn_url.collection('audio');
    var news3 = await coll3.find().toList();
    print(news3.length);
    main_page_controller.loaded_audio = true;
    main_page_controller.audio = news3;
    print(main_page_controller.audio.length);
    ///////////////////////////////////////////
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var coll4 = conn_url.collection('accounts');
    var news_ = await coll4.find(where.eq("email", "${prefs.getString("email")}")).toList();
    print(news_.length);
    main_page_controller.account = news_;
    conn_url.close();
    main_page_controller.connected = true;
    main_page_controller.loaded_live_news = true;
    main_page_controller.loaded_audio = true;
    main_page_controller.loaded_account = true;
    conn_url.close();
    print("Account Info - ${main_page_controller.account}");
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Main_Page()));
  }



}