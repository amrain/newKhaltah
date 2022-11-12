import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/UI/EditPasswordSecreen.dart';

import 'ConditionsScreen.dart';
import 'ConnectUS/ContactUsScreen.dart';
import 'ProfileScreen.dart';
import 'WhoWeScreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات',style: TextStyle(fontSize: 18.sp),),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  AppRouter.NavigatorToWidget(ProfileScreen());
                },
                child: EditWidget(
                  title: 'تعديل الملف الشخصي',
                  pathImage: 'assets/images/Edit Square.svg',
                ),
              ),
              InkWell(
                onTap: (){
                  AppRouter.NavigatorToWidget(EditPasswordScreen());
                },
                child: EditWidget(
                  title: 'تغيير كلمة المرور',
                  pathImage: 'assets/images/passwordEdit.svg',
                ),
              ),
              InkWell(
                onTap: (){
                  AppRouter.NavigatorToWidget(ConditionsScreen());
                },
                child: EditWidget(
                  title: 'الشروط والاحكام والخصوصية',
                  pathImage: 'assets/images/Shield Done.svg',
                ),
              ),
              InkWell(
                onTap: (){
                  AppRouter.NavigatorToWidget(WhoWeScreen());

                },
                child: EditWidget(
                  title: 'من نحن',
                  pathImage: 'assets/images/whereUs.svg',
                ),
              ),
              InkWell(
                onTap: (){
                  AppRouter.NavigatorToWidget(ContactUsScreen());
                },
                child: EditWidget(
                  title: 'تواصل معنا',
                  pathImage: 'assets/images/Message.svg',
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                },
                child: EditWidget(
                  title: 'تسجيل الخروج',
                  pathImage: 'assets/images/Logout.svg',
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditWidget extends StatelessWidget {
  EditWidget({required this.pathImage,required this.title,this.color});
   String title;
   String pathImage;
   Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(pathImage,height: 22.h,),
              SizedBox(width: 20.w,),
              Text(title,style: TextStyle(fontSize: 16.sp,color: color??Colors.black),),
            ],
          ),
          Divider(
            height: 30.h,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

