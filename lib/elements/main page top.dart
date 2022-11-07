import 'package:broadcast/assets%20controller/assets%20controller.dart';
import 'package:broadcast/elements/main%20page%20top%20search.dart';
import 'package:flutter/cupertino.dart';

import 'main page top drawer.dart';

class main_page_top extends StatelessWidget {
  const main_page_top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image(
              image: AssetImage(assets_controller.logo),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(child: main_page_top_search()),
          SizedBox(width: 5,),
          main_page_top_drawer(),
          SizedBox(width: 2,)
        ],
      ),
    );
  }
}
