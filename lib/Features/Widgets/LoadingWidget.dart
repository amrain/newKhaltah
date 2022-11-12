import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ColorUi.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: ColorUi.mainColor,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const CircularProgressIndicator(color: Colors.white,),
          SizedBox(height: 15.h,),
          const Text('انتظار ...',style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
