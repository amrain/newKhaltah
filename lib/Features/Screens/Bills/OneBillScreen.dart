import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class OneBillScreen extends StatelessWidget {
  const OneBillScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotoView(

      imageProvider: AssetImage("assets/images/022.png"),
    );
  }
}
