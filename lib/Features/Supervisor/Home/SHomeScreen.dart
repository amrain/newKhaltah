import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:khaltah/Features/Screens/Notification/NotificationProvider.dart';
import 'package:khaltah/Features/Screens/Notification/NotificationScreen.dart';
import 'package:khaltah/Features/Screens/SettingsScreen.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import 'SHomeProvider.dart';


class SHomeScreen extends StatelessWidget {
  const SHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset('assets/images/753f6e29-c7ac-44bc-ad1f-6707cccebcd0.png',
                width: MediaQuery.of(context).size.width,height: 300.h,fit: BoxFit.fill,),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('مرحبا بك في منزلك الجديد',style: TextStyle(color: Colors.white,fontSize: 18.sp),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            AppRouter.NavigatorToWidget(SettingsScreen());

                          },
                              icon: Icon(Icons.settings,color: Colors.white,)),
                          IconButton(onPressed: (){
                            Provider.of<NotificationProvider>(context,listen: false).getNotification();
                            AppRouter.NavigatorToWidget(NotificationScreen());
                          },
                              icon: Icon(Icons.notifications,color: Colors.white,)),
                        ],
                      ),
                    ),
                    SizedBox(height: 190.h,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),topRight: Radius.circular(15.r))
                        ),
                        child:
                        // provider.ProjectsTasheed.isEmpty ?
                        // const Center(child: LoadingWidget())
                        //     :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BoxHome(title: "العقود", number: "4"),
                                BoxHome(title: "الاعمال", number: "4"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BoxHome(title: "فواتير", number: "4"),
                                BoxHome(title: "جدول الاعمال", number: "4"),
                              ],
                            )
                          ],
                        ),

                      ),
                    )


                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

class BoxHome extends StatelessWidget {
  // const BoxHome({Key? key}) : super(key: key);
  String title;
  String number;
  BoxHome({required this.title,required this.number,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,width: 150.w,
      decoration: BoxDecoration(
        color: ColorUi.mainColor.withOpacity(.07),
        borderRadius: BorderRadius.circular(15),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title,style: TextStyle(fontSize: 22.sp,color: ColorUi.mainColor),),
          Text(number,style: TextStyle(fontSize: 60.sp,color: Colors.grey),),
        ],
      ),
    );
  }
}

