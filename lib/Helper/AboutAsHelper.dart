

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/AboutUs/AboutUsprovider.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Models/AboutAsModel.dart';
import 'package:provider/provider.dart';

import '../Features/Screens/Authentication/AuthProvider.dart';

class AboutAsHelper {
  AboutAsHelper._();
  static AboutAsHelper aboutAsHelper= AboutAsHelper._();
  Dio dio = Dio();
  String basedUrl = API.basedUrl;

    aboutUs ()async{
     // try{
       Response  response = await dio.get("$basedUrl/about_us",
           options: Options(
               headers: {
                 "Authorization" : "Bearer ${Provider.of<AuthProvider>(AppRouter.navKey.currentContext!,listen: false).User.accessToken}"
               }
           ));
       AboutUsModel aboutUsModel = AboutUsModel.fromJson(response.data);
       return aboutUsModel.data!;
     // }
     // catch(e){
     //   API.showErrorMsg();
     //   Provider.of<AboutUsProvider>(AppRouter.navKey.currentContext!,listen: false).loading=false;
     // }

  }






}