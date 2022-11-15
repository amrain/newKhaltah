import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Bills/UI/AllContractsForBillsScreen.dart';
import 'ConnectUS/ContactUsScreen.dart';
import 'Contracts/UI/AllContractsScreen.dart';
import 'FollowupProjrcts/UI/AllContractsForFollowUpScreen.dart';
import 'Home/HomeScreen.dart';


class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    AllContractsScreen(),
    AllContractsForFollowUpScreen(),
    AllContractsForBillsScreen(),
    ContactUsScreen(),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.menu,
      //     color: Theme.of(context).primaryColor,
      //   ),
      //   title: Text(
      //     "Geeks For Geeks",
      //     style: TextStyle(
      //       color: Theme.of(context).primaryColor,
      //       fontSize: 25,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 80.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
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
            GestureDetector(
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
            GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 2;
                });
              },
              child: pageIndex == 2 ?
              NavBarOnButton(
                pathImage: 'assets/images/متابعة الاعمال1.svg',
                title: 'متابعة الاعمال',
              )
                  : NavBarOffButton(title: 'متابعة الاعمال', pathImage: 'assets/images/متابعة الاعمال2.svg'),),
            GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 3;
                });
              },
              child: pageIndex == 3 ?
              NavBarOnButton(
                pathImage: 'assets/images/فواتير1.svg',
                title: 'الفواتير',
              )
                  : NavBarOffButton(title: 'الفواتير', pathImage: 'assets/images/فواتير2.svg'),),
            GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = 4;
                });
              },
              child: pageIndex == 4 ?
              NavBarOnButton(
                pathImage: 'assets/images/تواصل معنا1.svg',
                title: 'تواصل معنا',
              )
                  : NavBarOffButton(title: 'تواصل معنا', pathImage: 'assets/images/تواصل معنا2.svg'),),

          ],
        ),
      ),
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
            color: Color(0xffEEF7FC),
          ),
          child: SvgPicture.asset(pathImage,height: 25.h,),
          alignment: Alignment.center,
        ),
        Text(title,style: TextStyle(fontSize: 13.sp,height: 1.2),)
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
            child: SvgPicture.asset(pathImage,height: 25.h,)),
        Text(title,style: TextStyle(fontSize: 10.sp,height: 1),)
      ],
    );
  }
}

