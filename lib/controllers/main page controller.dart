import 'package:broadcast/registration/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class main_page_controller{

  static bool data_loaded = false;
  static bool connected = false;
  static bool loaded_live_news = false;
  static bool loaded_account = false;
  static bool loaded_audio = false;
  static var live_news ;
  static var audio ;
  static var news ;
  static var url ;
  static var title ;
  static var photo ;
  static var account ;


  //////////////// NETWORKING /////////////////////



  static load_account()async {
    if(loaded_account == false){
      final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
      await conn_url.open();
      loaded_account = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var coll = conn_url.collection('accounts');
      var news_ = await coll.find(where.eq("email", "${prefs.getString("email")}")).toList();
      conn_url.close();
      print(news_.length);
      main_page_controller.loaded_account = true;
      main_page_controller.account = news_;
      return account;
    }else{
      return account;
    }
  }

  static load_news()async {
  if(connected == false){
    final conn_url = await Db.create("mongodb+srv://broadcast_server_access:123qpa456lzm@broadcast.eevngdm.mongodb.net/broadcast_api?retryWrites=true&w=majority");
    await conn_url.open();
    connected = true;
    var coll = conn_url.collection('news_feed');
    var news_ = await coll.find().toList();
    conn_url.close();
    print(news_.length);
    main_page_controller.data_loaded = true;
    news = news_;
    return news;
  }else{
    return news;
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
      live_news = news;
      print(live_news.length);
      return live_news;
    }else{
      return live_news;
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
      audio = news;
      print(audio.length);
      return audio;
    }else{
      return audio;
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