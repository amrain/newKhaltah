import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class API {
  static String basedUrl = 'https://khalta.concept-miracle.com/api';
  static String imageUrl = 'https://khalta.concept-miracle.com/';
  static showErrorMsg(){
    Fluttertoast.showToast(
        msg: 'حدث خطأ غير متوقع',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 12.sp
    );
  }
}