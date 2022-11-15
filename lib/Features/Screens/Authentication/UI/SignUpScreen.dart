import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/AboutUs/ConditionsScreen.dart';
import 'package:provider/provider.dart';

import '../../../../AppRouter.dart';
import '../AuthProvider.dart';
import '../../../ColorUi.dart';
import '../../../Widgets/TextFieldWidget.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  bool Password = true;
  bool repeatPassword = true;
  @override
  Widget build(BuildContext context) {

    return Consumer<AuthProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('انشاء حساب',style: TextStyle(fontSize: 18.sp),),
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  SvgPicture.asset('assets/images/logo.svg',height: 100.h,),
                  SizedBox(height: 30.h,),
                  Container(
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
                      key: provider.registerKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h,),
                          TextFieldWidget(
                            hintText: 'الاسم ثلاثي',
                            validator: provider.nullValidation,
                            controller: provider.nameController,
                          ),
                          SizedBox(height: 10.h,),

                          TextFieldWidget(
                            hintText: 'البريد الإلكتروني',
                            suffix: Icon(Icons.email_outlined,color: Colors.grey,),
                            validator: provider.emailValidation,
                            controller: provider.emailController,
                          ),
                          SizedBox(height: 10.h,),

                          TextFieldWidget(
                            hintText: 'رقم الجوال',
                            validator: provider.nullValidation,
                            controller: provider.phoneController,
                          ),
                          SizedBox(height: 10.h,),

                          TextFieldWidget(
                            hintText: 'المدينة',
                            validator: provider.nullValidation,
                            controller: provider.CityController,
                          ),
                          SizedBox(height: 10.h,),
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
                            validator: provider.passwordValidation,
                            controller: provider.passwordController,
                          ),
                          SizedBox(height: 10.h,),
                          TextFieldWidget(
                            hintText: 'تأكيد كلمة المرور',
                            suffix: InkWell(
                                onTap: (){
                                  setState(() {
                                    repeatPassword = !repeatPassword;
                                  });
                                },
                                child: Icon(
                                  repeatPassword?
                                  Icons.visibility_outlined : Icons.visibility_off_outlined,
                                  color: Colors.grey,)
                            ),
                            isPassword: repeatPassword,
                            validator: provider.passwordValidation,
                            controller: provider.password_confirmationController,

                          ),
                          SizedBox(height: 15.h,),
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
                                  const Text(
                                    'الموافقة على ',
                                    style: TextStyle(fontSize: 17.0),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      AppRouter.NavigatorToWidget(ConditionsScreen());
                                    },
                                    child: Text(
                                      'الشروط والاحكام',
                                      style: TextStyle(fontSize: 17.0,color: ColorUi.mainColor),
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          ),
                          SizedBox(height: 5.h,),
                          InkWell(
                            onTap: (){
                              if(provider.registerKey!.currentState!.validate())
                              {
                                if(value == true){
                                  // AppRouter.NavigatorToWidgetWithReplacement(NavBarWidget());
                                  provider.register();
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
                              child: Text('انشاء حساب جديد',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                            ),
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('هل لديك حساب؟ ',style: TextStyle(color: Colors.grey),),
                              GestureDetector(
                                onTap: (){
                                  AppRouter.popFromWidget();
                                },
                                  child: Text('تسجيل الدخول',style: TextStyle(color: ColorUi.mainColor),))
                            ],
                          ),
                          SizedBox(height: 10.h,),



                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
