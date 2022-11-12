import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Home/HomeProvider.dart';
import 'package:khaltah/Features/Screens/NotificationScreen.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../Helper/API.dart';
import '../SettingsScreen.dart';
import 'Section/SectionScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                        provider.ProjectsTasheed.isEmpty ?
                        const Center(child: LoadingWidget())
                            :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('التشييد والبناء',style: TextStyle(color: ColorUi.mainColor,fontSize: 20.sp),),
                            ),
                            SizedBox(height: 15.h,),
                            SizedBox(
                              height: 120.h,
                              child: ListView.builder(
                                  itemCount: provider.ProjectsTasheed.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          provider.getSections(provider.ProjectsTasheed[index].id.toString());
                                          AppRouter.NavigatorToWidget(SectionScreen());
                                        },
                                        child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Color(0xffEEF7FC),
                                                radius: 40.r,
                                                child: Image.network("${API.imageUrl}${provider.ProjectsTasheed[index].icon}"),
                                              ),
                                              SizedBox(height: 5.h,),
                                              Text(provider.ProjectsTasheed[index].name??"",style: TextStyle(color: ColorUi.mainColor,fontSize: 10.sp),),
                                            ]),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(height: 30.h,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('التشطيبات',style: TextStyle(color: Color(0xff808000),fontSize: 20.sp),),
                            ),
                            SizedBox(height: 15.h,),
                            SizedBox(
                              height: 120.h,

                              child: ListView.builder(
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          provider.getSections(provider.ProjectsTashteb[index].id.toString());
                                          AppRouter.NavigatorToWidget(SectionScreen());
                                        },
                                        child: Column(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Color(0xffF9F9E4),
                                                radius: 40.r,
                                                child: Image.network("${API.imageUrl}${provider.ProjectsTashteb[index].icon}"),
                                              ),
                                              SizedBox(height: 5.h,),
                                              Text(provider.ProjectsTashteb[index].name??"",style: TextStyle(color: Color(0xff808000),fontSize: 10.sp),),
                                            ]),
                                      ),
                                    );
                                  }),
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
