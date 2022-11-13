import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class OneBillScreen extends StatelessWidget {
  // const OneBillScreen({Key? key}) : super(key: key);
  String imagePath;
  OneBillScreen(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return PhotoView(

      imageProvider: NetworkImage(imagePath),
    );
  }
}
