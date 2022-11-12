import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';

import '../../ColorUi.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('تواصل معنا',style: TextStyle(fontSize: 18.sp),),
        centerTitle: false,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(hintText: '+966591234567',
                labelText: 'رقم الموبايل',
              ),
              SizedBox(height: 25.h,),
              TextFieldWidget(hintText: 'example@mail.com',
                labelText: 'البريد الإلكتروني',
              ),
              SizedBox(height: 50.h,),
              Text('نص الرسالة'),
              SizedBox(height: 15.h,),
              TextFieldWidget(hintText: 'نص الرسالة ...',maxLine: 7,),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.scale,
                    title: 'تم الارسال',
                    desc: 'تم ارسال الرسالة بنجاح',
                    btnOkText: 'موافق',
                    btnOkOnPress: () {},
                  ).show();

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
                  child: Text('ارسال',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
