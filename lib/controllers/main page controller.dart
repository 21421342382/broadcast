import 'package:broadcast/registration/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class main_page_controller{

  static bool data_loaded = false;
  static bool connected = false;
  static bool loaded_live_news = false;
  static bool loaded_audio = false;
  static var _live_news ;
  static var _audio ;
  static var _news ;
  static var url ;
  static var title ;
  static var photo ;


  //////////////// NETWORKING /////////////////////

static load_news()async {
  if(connected == false){
    final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
    await conn_url.open();
    connected = true;
    var coll = conn_url.collection('news_feed');
    var news = await coll.find().toList();
    conn_url.close();
    print(news.length);
    main_page_controller.data_loaded = true;
    _news = news;
    return _news;
  }else{
    return _news;
  }
}

static load_live_news()async {
    if(loaded_live_news == false){
      final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
      await conn_url.open();
      connected = true;
      var coll = conn_url.collection('live_news');
      var news = await coll.find().toList();
      conn_url.close();
      print(news.length);
      main_page_controller.loaded_live_news = true;
      _live_news = news;
      print(_live_news.length);
      return _live_news;
    }else{
      return _live_news;
    }
  }

  static load_music()async {
    if(loaded_audio == false){
      final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
      await conn_url.open();
      connected = true;
      var coll = conn_url.collection('audio');
      var news = await coll.find().toList();
      conn_url.close();
      print(news.length);
      main_page_controller.loaded_audio = true;
      _audio = news;
      print(_audio.length);
      return _audio;
    }else{
      return _audio;
    }
  }

////////////////////////// Functions /////////////////////////////////

static Future like_button_controller(context)async{

  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString("Is Logged In") == "true"){
    return "Allowed";
  }else{
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));
  }
}

}