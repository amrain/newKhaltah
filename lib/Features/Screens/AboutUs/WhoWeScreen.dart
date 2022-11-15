import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/AboutUs/AboutUsprovider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import '../../ColorUi.dart';
import '../../Widgets/TextFieldWidget.dart';

class WhoWeScreen extends StatelessWidget {
   WhoWeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('من نحن',style: TextStyle(fontSize: 18.sp),),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: (provider.loading)
                  ?SizedBox(height:1.sh,child: Center(child: LoadingWidget()))
                  :Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 15.h,),
                    SvgPicture.asset('assets/images/logo.svg',height: 80.h,),
                    SizedBox(height: 30.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 130.w,
                          padding: EdgeInsets.all(8),
                          height: 40.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:  Color(0xffEEF7FC),
                            borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: const Text('نبذه تعريفيه',
                            style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Text('''${provider.whoWe}''',style: TextStyle(height: 1.5),),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 130.w,
                          padding: EdgeInsets.all(8),
                          height: 40.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:  Color(0xffEEF7FC),
                            borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          ),
                          child: const Text('معلومات التواصل',
                            style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset('assets/images/تويتر.svg',height: 40.h,),
                        SvgPicture.asset('assets/images/انستا.svg',height: 40.h,),
                        SvgPicture.asset('assets/images/واتس.svg',height: 40.h,),
                        SvgPicture.asset('assets/images/ايميل.svg',height: 40.h,),
                      ],
                    ),
                    SizedBox(height: 20.h,),


                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

}
