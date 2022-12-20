import 'package:broadcast/audio/audio%20shimmer.dart';
import 'package:broadcast/controllers/main%20page%20controller.dart';
import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:broadcast/elements/something%20went%20wrong.dart';
import 'package:flutter/cupertino.dart';

class account_page extends StatelessWidget {
  const account_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: main_page_controller.load_account(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return audio_shimmer();
      }else if(snapshot.hasError){
        return something_with_wrong();
      }else{
        return Container();
      }
    });
  }
}
