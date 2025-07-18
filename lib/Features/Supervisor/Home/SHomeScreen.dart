import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
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
    return Consumer<SHomeProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      BounceInRight(child: Text('مرحبا بك يا مشرف',style: TextStyle(color: ColorUi.mainColor,fontSize: 20.sp),)),
                      const Spacer(),
                      ZoomIn(
                        child: IconButton(onPressed: (){
                          log('message');
                          provider.getDashboard();
                          Provider.of<ContractsProvider>(context,listen: false).getAllContractsSupervisor();
                        },
                            icon: Icon(Icons.refresh,color: ColorUi.mainColor,)),
                      ),
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
                    provider.loading ?
                    const Center(child: LoadingWidget())
                        :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeInRight(child: BoxHome(title: "العقود", number: provider.dashboard!.contracts.toString())),
                            FadeInDown(child: BoxHome(title: "الاعمال", number: provider.dashboard!.work.toString())),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FadeInUp(child: BoxHome(title: "فواتير", number: provider.dashboard!.invoices.toString())),
                            FadeInLeft(child: BoxHome(title: "جدول الاعمال", number: provider.dashboard!.scheduleOfWork.toString())),
                          ],
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

