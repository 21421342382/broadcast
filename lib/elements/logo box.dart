import 'package:broadcast/controllers/sign%20up%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class logo_sign_up_box extends StatefulWidget {
  const logo_sign_up_box({Key? key}) : super(key: key);

  @override
  State<logo_sign_up_box> createState() => _logo_sign_up_boxState();
}

class _logo_sign_up_boxState extends State<logo_sign_up_box> {
  @override

  final ImagePicker picker = ImagePicker();
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        final pickedFile = await picker.getImage(source: ImageSource.gallery);
        if(pickedFile!=null){
          var _cmpressed_image;
          try {
            _cmpressed_image = await FlutterImageCompress.compressWithFile(
                pickedFile.path,
                format: CompressFormat.heic,
                quality: 70
            );
            setState(() {
              sign_up_controller.image_user = _cmpressed_image;
              sign_up_controller.has_image = true;
            });
            print(sign_up_controller.image_user);
          } catch (e) {
            _cmpressed_image = await FlutterImageCompress.compressWithFile(
                pickedFile.path,
                format: CompressFormat.jpeg,
                quality: 70
            );
            setState(() {
              sign_up_controller.image_user = _cmpressed_image;
              sign_up_controller.has_image = true;
            });
            print(sign_up_controller.image_user);
          }
        }

      },
      child: AnimatedContainer(
        height: 65,
        width: 65,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(60)),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child:
          sign_up_controller.has_image ?
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: sign_up_controller.image_type_net
            ? Image.network(sign_up_controller.image_user,height: 65,width: 65,scale: 20)
            : Image.memory(sign_up_controller.image_user,height: 65,width: 65,scale: 20,)
          )
           : Icon(Icons.add_photo_alternate_outlined,color: Colors.grey,),
        ),
      ),
    );
  }
}
