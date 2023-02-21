import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:khaltah/Features/Screens/Home/Section/SectionProvider.dart';
import 'package:khaltah/Features/Screens/Notification/NotificationProvider.dart';
import 'package:khaltah/Features/Screens/Notification/NotificationScreen.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../Helper/API.dart';
import '../SettingsScreen.dart';
import 'Section/UI/SectionScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      BounceInRight(child: Text('مرحبا بك في منزلك الجديد',style: TextStyle(color: ColorUi.mainColor,fontSize: 18.sp),)),
                      const Spacer(),
                      ZoomIn(
                        child: IconButton(onPressed: (){
                          AppRouter.NavigatorToWidget(SettingsScreen());

                        },
                            icon: Icon(Icons.settings,color: ColorUi.mainColor,)),
                      ),
                      ZoomIn(
                        child: IconButton(onPressed: (){
                          Provider.of<NotificationProvider>(context,listen: false).getNotification();
                          AppRouter.NavigatorToWidget(NotificationScreen());
                        },
                            icon: Icon(Icons.notifications,color: ColorUi.mainColor,)),
                      ),
                    ],
                  ),
                ),
                Image.asset('assets/images/عمال.png',
                  width: MediaQuery.of(context).size.width,height: 200.h,fit: BoxFit.contain,),

                // SizedBox(height: 190.h,),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade50,
                          spreadRadius: 1,
                          offset: Offset(0,-1),
                          blurStyle: BlurStyle.normal,
                          blurRadius: 4
                        )
                      ],
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
                    ),
                    child:
                    provider.ProjectsTasheed.isEmpty ?
                    const Center(child: LoadingWidget())
                        :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZoomIn(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('التشييد والبناء',style: TextStyle(color: ColorUi.mainColor,fontSize: 20.sp),),
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        FadeInLeft(
                          child: SizedBox(
                            height: 120.h,
                            child: ListView.builder(
                                itemCount: provider.ProjectsTasheed.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      onTap: (){
                                        Provider.of<SectionProvider>(context,listen: false).getSections(provider.ProjectsTasheed[index].id.toString());
                                        AppRouter.NavigatorToWidget(SectionScreen());
                                      },
                                      child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Color(0xffEEF7FC),
                                              radius: 40.r,
                                              child: Image.network("${API.imageUrl}${provider.ProjectsTasheed[index].icon}",height: 70.h,),
                                            ),
                                            SizedBox(height: 5.h,),
                                            Text(provider.ProjectsTasheed[index].name??"",style: TextStyle(color: ColorUi.mainColor,fontSize: 10.sp),),
                                          ]),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        FadeInRight(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('التشطيبات',style: TextStyle(color: ColorUi.Color2,fontSize: 20.sp),),
                            // child: Text('التشطيبات',style: TextStyle(color: Color(0xff808000),fontSize: 20.sp),),
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        SlideInUp(
                          child: SizedBox(
                            height: 120.h,

                            child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      onTap: (){
                                        Provider.of<SectionProvider>(context,listen: false).getSections(provider.ProjectsTashteb[index].id.toString());
                                        AppRouter.NavigatorToWidget(SectionScreen());
                                      },
                                      child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Color(0xffF9F9E4),
                                              radius: 40.r,
                                              child: Image.network("${API.imageUrl}${provider.ProjectsTashteb[index].icon}",height: 70.h,),
                                            ),
                                            SizedBox(height: 5.h,),
                                            Text(provider.ProjectsTashteb[index].name??"",style: TextStyle(color: ColorUi.Color2,fontSize: 10.sp),),
                                            // Text(provider.ProjectsTashteb[index].name??"",style: TextStyle(color: Color(0xff808000),fontSize: 10.sp),),
                                          ]),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
        );
      }
    );
  }
}
