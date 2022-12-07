import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:provider/provider.dart';

import '../../ColorUi.dart';

class SBondScreen extends StatelessWidget {
  const SBondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('السندات',style: TextStyle(fontSize: 18.sp),),
              centerTitle: false,

            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    // key: provider.ConnectUsKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidget(hintText: '0111',
                          labelText: 'رقم العقد أو الهوية',
                          // controller: provider.phone,
                          // validator: provider.phoneValidation,
                        ),
                        SizedBox(height: 25.h,),
                        TextFieldWidget(hintText: 'محمد أحمد',
                          labelText: 'اسم المشرف',
                          // controller: provider.email,
                          // validator: provider.emailValidation,
                        ),
                        SizedBox(height: 25.h,),
                        TextFieldWidget(
                          labelText: 'مبلغ الصرف',
                          // controller: provider.phone,
                          // validator: provider.phoneValidation,
                        ),
                        SizedBox(height: 25.h,),
                        TextFieldWidget(
                          labelText: 'سبب الصرف',
                          // controller: provider.phone,
                          // validator: provider.phoneValidation,
                        ),
                        SizedBox(height: 25.h,),
                        TextFieldWidget(hintText: '1/1/2021',
                          labelText: 'تاريخ طلب السند',
                          // controller: provider.phone,
                          // validator: provider.phoneValidation,
                        ),
                        SizedBox(height: 50.h,),
                        InkWell(
                          onTap: (){
                            // if(provider.ConnectUsKey!.currentState!.validate()){
                            //   provider.ConnectUS();
                            // }
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
                            // provider.loading?
                            // CircularProgressIndicator(color: Colors.white,):
                            Text('حفظ وارسال',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
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
}
