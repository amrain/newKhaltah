import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewPhotoScreen extends StatelessWidget {
  // const OneBillScreen({Key? key}) : super(key: key);
  String imagePath;
  ViewPhotoScreen(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoView(
        imageProvider: NetworkImage(imagePath),

      ),
    );


  }
}
