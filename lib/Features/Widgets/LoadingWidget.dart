import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../ColorUi.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      height: 140.h,
      width: 120.w,
      decoration: BoxDecoration(
          color: Colors.white70,
          // color: ColorUi.mainColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: LoadingAnimationWidget.fourRotatingDots(color: ColorUi.mainColor, size: 80),
    );
  }
}
