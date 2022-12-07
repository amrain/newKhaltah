import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import '../../ColorUi.dart';

class SAddInvoiceScreen extends StatelessWidget {
  const SAddInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('إضافة فاتورة',style: TextStyle(fontSize: 18.sp),),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/images/Group979.svg',height: 30.h,),
                        SizedBox(width: 8.w,),
                        Text('0119',style: TextStyle(fontSize: 18.sp),)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  TextFieldWidget(hintText: 'اسم أو تاريخ الفاتورة',
                    labelText: 'اسم أو تاريخ الفاتورة',
                    // controller: provider.phone,
                    // validator: provider.phoneValidation,
                  ),
                  SizedBox(height: 25.h,),
                  TextFieldWidget(hintText: '1-1-2022',
                    labelText: 'تاريح الفاتورة',
                    // controller: provider.email,
                    // validator: provider.emailValidation,
                  ),
                  SizedBox(height: 15.h,),
                  Text('إضافة صورة',style: TextStyle(fontSize: 18.sp),),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    height: 180.h,width: 130.w,
                    child: DottedBorder(
                        color: Colors.grey.shade300,
                        strokeWidth: 2,
                        dashPattern:[8],
                        child:  Center(child: SvgPicture.asset('assets/images/upload.svg',height: 50.h,))),
                  ),
                  SizedBox(height: 30.h,),
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

