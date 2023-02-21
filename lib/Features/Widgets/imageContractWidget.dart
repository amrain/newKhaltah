import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/Features/ColorUi.dart';

class ImageContract extends StatelessWidget {
  // const ImageContract({Key? key}) : super(key: key);
  Color? color;
  double? height;
  ImageContract({this.color,this.height});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/Group979.svg',height: height??50.h,color: color??ColorUi.mainColor,);
  }
}
