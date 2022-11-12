import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../ColorUi.dart';
import '../Widgets/TextFieldWidget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  bool enable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تعديل الملف الشخصي',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.normal),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff1B7AA7).withOpacity(.2),
        foregroundColor: Colors.black,

      ),
      body: Stack(
        children: [
          Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: Color(0xff1B7AA7).withOpacity(.2),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.r),bottomLeft: Radius.circular(25.r))
            ),
          ),
          SizedBox(
            width: 1.sw,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h,),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage('assets/images/WhatsApp Image 2021-12-24 at 11.24.46 PM.png'),
                      ),
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor: Colors.black26,
                        child: InkWell(
                          onTap: (){},
                            child: SvgPicture.asset('assets/images/Camera.svg')),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h,),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(2,2),
                            color: Colors.grey,
                            blurRadius: 2,
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        const Text('البيانات الشخصية',style: TextStyle(color: Colors.red),),
                        SizedBox(height: 20.h,),
                        TextFieldWidget(
                          labelText: 'الاسم ثلاثي',
                          hintText: 'محمد محمود البديري ',
                          enabled: enable,
                        ),
                        SizedBox(height: 20.h,),
                        TextFieldWidget(
                          labelText: 'البريد الإلكتروني',
                          hintText: 'example@mail.com',
                          enabled: enable,
                        ),
                        SizedBox(height: 20.h,),
                        TextFieldWidget(
                          labelText: 'رقم الهاتف',
                          hintText: '0096655546665',
                          enabled: enable,
                        ),
                        SizedBox(height: 20.h,),
                        TextFieldWidget(
                          labelText: 'المدينة ',
                          hintText: 'مكة',
                          enabled: enable,
                        ),
                        SizedBox(height: 20.h,),

                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:  ColorUi.mainColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            offset: Offset(0, 3),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Text('حفظ',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
