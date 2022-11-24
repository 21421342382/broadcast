import 'package:flutter/cupertino.dart';

import '../elements/music card.dart';

class audio extends StatelessWidget {
  const audio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        music_card()
      ],
    );
  }
}
