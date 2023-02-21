import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Supervisor/Contracts/UI/SAllContractsScreen.dart';
import 'package:khaltah/Features/Supervisor/Home/SHomeScreen.dart';
import 'package:provider/provider.dart';
import '../Screens/Bills/UI/AllContractsForBillsScreen.dart';
import '../Screens/ConnectUS/ContactUsScreen.dart';
import '../Screens/Contracts/UI/AllContractsScreen.dart';
import '../Screens/FollowupProjrcts/UI/AllContractsForFollowUpScreen.dart';
import '../Screens/Home/HomeScreen.dart';
import '../Supervisor/Bond/SBondScreen.dart';
import '../Supervisor/ScheduleOfWork/UI/SAllContractsForScheduleScreen.dart';
import '../Supervisor/WorkAndBill/UI/SAllContractsForWorkAndBillScreen.dart';


class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int pageIndex = 0;
  int? type;

  final pagesUser = [

    HomeScreen(),
    AllContractsScreen(),
    AllContractsForFollowUpScreen(),
    AllContractsForBillsScreen(),
    ContactUsScreen(),
  ];

  final pagesSupervisor = [
    SHomeScreen(),
    SAllContractsScreen(),
    SAllContractsForWorkAndBillScreen(),
    SBondScreen(),
    SAllContractsForScheduleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,x) {
        return WillPopScope(
          onWillPop: () {
            if(Navigator.canPop(context)) {
            return Future.value(false);
          }else
            {
              if(pageIndex > 0){
                setState(() {
                  pageIndex = 0;
                });
                return Future.value(false);
              }
              else{
                AwesomeDialog(
                    context: AppRouter.navKey.currentContext!,
                    dialogType: DialogType.warning,
                    animType: AnimType.scale,
                    title: 'الخروج من التطبيق',
                    desc: 'هل انت متأكد من الخروج من التطبيق ؟',
                    btnOkText: 'لا',
                    btnOkOnPress: () {},
                    btnCancelOnPress:(){
                      SystemNavigator.pop();
                    },
                    btnCancelText: 'نعم'
                ).show();
                return Future.value(false);
              }

            }
        },
          child: Scaffold(
            body: provider.User.type == "3"? pagesUser[pageIndex] : pagesSupervisor[pageIndex],
            bottomNavigationBar: Container(
              height: 80.h,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    child: pageIndex == 0 ?
                        NavBarOnButton(
                          pathImage: 'assets/images/Home1.svg',
                          title: 'الرئيسة',
                        )
                        : NavBarOffButton(title: 'الرئيسة', pathImage: 'assets/images/Home2.svg'),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        pageIndex = 1;
                      });
                    },
                    child: pageIndex == 1 ?
                    NavBarOnButton(
                      pathImage: 'assets/images/Group979.svg',
                      title: 'العقود',
                    )
                        : NavBarOffButton(title: 'العقود', pathImage: 'assets/images/عقود2.svg'),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        pageIndex = 2;
                      });
                    },
                    child: pageIndex == 2 ?
                    NavBarOnButton(
                      pathImage: 'assets/images/متابعة الاعمال1.svg',
                      title:provider.User.type == "3"? 'متابعة الاعمال' : 'اعمال وفواتير',
                    )
                        : NavBarOffButton(title: provider.User.type == "3"? 'متابعة الاعمال' : 'اعمال وفواتير', pathImage: 'assets/images/متابعة الاعمال2.svg'),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        pageIndex = 3;
                      });
                    },
                    child: pageIndex == 3 ?
                    NavBarOnButton(
                      pathImage: 'assets/images/فواتير1.svg',
                      title:provider.User.type == "3"? 'الفواتير' : 'السندات',
                    )
                        : NavBarOffButton(title:provider.User.type == "3"? 'الفواتير' : 'السندات', pathImage: 'assets/images/فواتير2.svg'),),
                  InkWell(
                    onTap: (){
                      setState(() {
                        pageIndex = 4;
                      });
                    },
                    child: pageIndex == 4 ?
                    NavBarOnButton(
                      pathImage: provider.User.type == "3"? 'assets/images/تواصل معنا1.svg' : 'assets/images/جدول الاعمال1.svg',
                      title: provider.User.type == "3"? 'تواصل معنا' : 'جدول الاعمال',
                    )
                        : NavBarOffButton(title: provider.User.type == "3"? 'تواصل معنا' : 'جدول الاعمال',
                        pathImage: provider.User.type == "3"? 'assets/images/تواصل معنا2.svg' : 'assets/images/جدول الاعمال2.svg'),),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}


class NavBarOnButton extends StatelessWidget {
  // const NavBarOnButton({Key? key}) : super(key: key);
  NavBarOnButton({required this.title,required this.pathImage});
  String pathImage;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorUi.mainColor.withOpacity(.1)
            // color: Color(0xffEEF7FC),
          ),
          child: SvgPicture.asset(pathImage,height: 25.h,color: ColorUi.mainColor,),
          alignment: Alignment.center,
        ),
        Text(title,style: TextStyle(fontSize: 13.sp,height: 1.2,color: ColorUi.mainColor,),)
      ],
    );
  }
}

class NavBarOffButton extends StatelessWidget {
   // NavBarOffButton({Key? key}) : super(key: key);
  NavBarOffButton({required this.title,required this.pathImage});
  String pathImage;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50.h,
            child: SvgPicture.asset(pathImage,height: 25.h)),
        Text(title,style: TextStyle(fontSize: 10.sp,height: 1),)
      ],
    );
  }
}

