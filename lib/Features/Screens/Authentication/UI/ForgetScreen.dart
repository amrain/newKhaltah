import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import '../../../ColorUi.dart';
import '../../../Widgets/TextFieldWidget.dart';


class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('نسيت كلمة المرور',style: TextStyle(fontSize: 18.sp),),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h,),
                      SvgPicture.asset('assets/images/logo.svg',height: 100.h,),
                      SizedBox(height: 50.h,),
                      Form(
                        key: provider.forgetPasswordKey,
                        child: Container(
                          margin: EdgeInsets.all(8),
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
                              TextFieldWidget(
                                validator: provider.emailValidation,
                                controller: provider.forgetPasswordController,
                                hintText: 'البريد الإلكتروني',
                                suffix: Icon(Icons.email_outlined,color: Colors.grey,),
                              ),
                              SizedBox(height: 20.h,),
                              InkWell(
                                onTap: (){
                                  if(provider.forgetPasswordKey!.currentState!.validate())
                                  {
                                    provider.forgetPassword();
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
                                  child: Text('ارسال',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                                ),
                              ),
                              SizedBox(height: 10.h,),



                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                provider.loading
                    ?SizedBox(height:1.sh,child: Center(child: LoadingWidget()))
                    :SizedBox(),


              ],
            ),
          ),
        );
      }
    );
  }
}
