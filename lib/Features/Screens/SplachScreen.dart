
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Authentication/UI/LoginScreen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../AppRouter.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);


  initFun()async{
    // Provider.of<FirestoreProvider>(AppRouter.navKey.currentContext!).getAllCourses();

    await Future.delayed(Duration(seconds: 3));
    AppRouter.NavigatorToWidgetWithReplacement(LoginScreen());

  }

  @override
  Widget build(BuildContext context) {
    initFun();

    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/conceptLogo.jpeg',height: 200.h,),
            SizedBox(height: 15.h,),
            LoadingAnimationWidget.stretchedDots(color: Color(0xff808122), size: 70),
          ],
        ),
      ),
    );
}}
