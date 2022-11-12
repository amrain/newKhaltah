

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Authentication/UI/LoginScreen.dart';

import '../../AppRouter.dart';
import '../ColorUi.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);


  initFun()async{
    // Provider.of<FirestoreProvider>(AppRouter.navKey.currentContext!).getAllCourses();

    await Future.delayed(Duration(seconds: 3));
    AppRouter.NavigatorToWidgetWithReplacement(LoginScreen());

    // AppRouter.NavigatorToWidgetWithReplacement(WelcomeScreen());

  }

  @override
  Widget build(BuildContext context) {
    initFun();

    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/images/logo.svg',height: 120.h,),
      ),
    );
}}
