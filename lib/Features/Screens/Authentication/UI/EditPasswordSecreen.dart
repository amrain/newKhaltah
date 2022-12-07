import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';
import '../../../ColorUi.dart';



class EditPasswordScreen extends StatefulWidget {
  EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  bool oldPassword = true;

  bool newPassword = true;

  bool repeatPassword = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('تغيير كلمة المرور',style: TextStyle(fontSize: 18.sp),),
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
                          key:provider.resetPasswordKey ,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h,),
                              TextFieldWidget(
                                hintText: 'كلمة المرور الحالية',
                                controller: provider.resetOldPassController,
                                validator: provider.passwordValidation,

                                suffix:InkWell(
                                    onTap: (){
                                      setState(() {
                                        oldPassword = !oldPassword;
                                        });
                                    },
                                    child: Icon(
                                      oldPassword?
                                      Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: Colors.grey,)
                                ),
                                isPassword: oldPassword,),

                              SizedBox(height: 10.h,),
                              TextFieldWidget(
                                hintText: 'كلمة المرور الجديدة',
                                controller: provider.resetNewPassController,
                                validator: provider.passwordValidation,
                                suffix: InkWell(
                                    onTap: (){
                                      setState(() {
                                        newPassword = !newPassword;
                                        });
                                    },
                                    child: Icon(
                                      newPassword?
                                      Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: Colors.grey,)
                                ),
                                isPassword: newPassword,
                              ),
                              SizedBox(height: 10.h,),
                              TextFieldWidget(
                                hintText: 'تأكيد كلمة المرور',
                                controller: provider.resetConfirmPassController,
                                validator: provider.passConfirm,
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
                              ),
                              SizedBox(height: 20.h,),
                              InkWell(
                                onTap: ()async{
                                  if(provider.resetPasswordKey!.currentState!.validate()){
                                    await provider.resetPassword();
                                    print('sadfewf');
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
                provider.loading?
                SizedBox(
                  height: 1.sh,
                  child: Center(
                    child: LoadingWidget(),
                  ),
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
