import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

import '../../ColorUi.dart';
import 'ConnectUSProvider.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectUSProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: HeadShake(child: Text('تواصل معنا',style: TextStyle(fontSize: 18.sp),)),
            centerTitle: false,

          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: provider.ConnectUsKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInLeft(
                        child: TextFieldWidget(hintText: '+966591234567',
                          labelText: 'رقم الموبايل',
                          controller: provider.phone,
                          validator: provider.phoneValidation,
                        ),
                      ),
                      SizedBox(height: 25.h,),
                      FadeInRight(
                        child: TextFieldWidget(hintText: 'example@mail.com',
                          labelText: 'البريد الإلكتروني',
                          controller: provider.email,
                          validator: provider.emailValidation,
                        ),
                      ),
                      SizedBox(height: 50.h,),
                      FadeInLeft(child: Text('نص الرسالة')),
                      SizedBox(height: 15.h,),
                      FadeInRight(
                        child: TextFieldWidget(hintText: 'نص الرسالة ...',maxLine: 7,
                          controller: provider.content,
                          validator: provider.nullValidation,
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      FadeInUp(
                        //
                        child: InkWell(
                          onTap: (){
                            if(provider.ConnectUsKey!.currentState!.validate()){
                              provider.ConnectUS();
                            }
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
                            child:
                                provider.loading?
                                    CircularProgressIndicator(color: Colors.white,):
                            Text('ارسال',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
