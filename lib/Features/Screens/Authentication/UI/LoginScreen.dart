import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/Features/Screens/AboutUs/AboutUsprovider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';
import '../../../../AppRouter.dart';
import '../../AboutUs/ConditionsScreen.dart';
import '../AuthProvider.dart';
import '../../../ColorUi.dart';
import '../../../Widgets/TextFieldWidget.dart';
import 'ForgetScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;
  bool Password = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: FadeInRight(child: Text('تسجيل الدخول',style: TextStyle(color: Colors.black,fontSize: 18.sp),)),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 30.h,),
                      FadeInDown(child: SvgPicture.asset('assets/images/logo.svg',height: 100.h,)),
                      SizedBox(height: 50.h,),
                      FadeInUp(
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
                          child: Form(
                            key: provider.loginKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h,),
                                TextFieldWidget(
                                  hintText: 'البريد الإلكتروني',
                                  suffix: Icon(Icons.email_outlined,color: Colors.grey,),
                                  controller: provider.emailLoginController,
                                  validator: provider.emailValidation,
                                  textInputType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 15.h,),
                                TextFieldWidget(
                                  hintText: 'كلمة المرور',
                                  suffix: InkWell(
                                      onTap: (){
                                        setState(() {
                                          Password = !Password;
                                        });
                                      },
                                      child: Icon(
                                        Password?
                                        Icons.visibility_outlined : Icons.visibility_off_outlined,
                                        color: Colors.grey,)
                                  ),
                                  isPassword: Password,
                                  controller: provider.passwordLoginController,
                                  validator: provider.passwordValidation,
                                ),
                                SizedBox(height: 15.h,),
                                GestureDetector(
                                    onTap: (){
                                      AppRouter.NavigatorToWidget(ForgetScreen());
                                    },
                                    child: Text('تذكير كلمة المرور !',style: TextStyle(fontSize: 15.sp,color: Colors.black54),)),
                                SizedBox(height: 25.h,),
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: CircleBorder(),
                                      activeColor: ColorUi.mainColor,
                                      fillColor:  MaterialStateProperty.all(ColorUi.mainColor),

                                      value: value,
                                      onChanged: (value) {
                                        setState(() {
                                          this.value = value!;
                                          log(value.toString());
                                        });
                                      },
                                    ),
                                    Row(
                                      children:  [
                                         Text(
                                          'الموافقة على ',
                                          style: TextStyle(fontSize: 17.sp),
                                        ),
                                        Text(
                                            'الشروط والاحكام',
                                            style: TextStyle(fontSize: 17.sp,color: ColorUi.mainColor),
                                          ),
                                      ],
                                    ),


                                  ],
                                ),
                                SizedBox(height: 5.h,),
                                InkWell(
                                  onTap: (){
                                    if(provider.loginKey!.currentState!.validate())
                                    {
                                      if(value == true){
                                        // AppRouter.NavigatorToWidgetWithReplacement(NavBarWidget());
                                        provider.login();
                                      }
                                      else{
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.info,
                                          animType: AnimType.rightSlide,
                                          title: 'مطلوب',
                                          desc: 'الموافقة على الشروط والأحكام',
                                          btnOkText: 'موافق',
                                          btnOkOnPress: () {},
                                        ).show();
                                      }
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
                                    child: Text('تسجيل الدخول',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                                  ),
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('ليس لديك حساب؟ ',style: TextStyle(color: Colors.grey),),
                                    GestureDetector(
                                        onTap: (){
                                          AppRouter.NavigatorToWidget(SignUpScreen());
                                        },
                                        child: Text('إنشاء حساب',style: TextStyle(color: ColorUi.mainColor),))
                                  ],
                                ),
                                SizedBox(height: 10.h,),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                provider.loading?
                Center(
                  child: LoadingWidget(),
                )
                    :SizedBox(),
              ],
            ),
          ),
        );
      }
    );
  }
}
