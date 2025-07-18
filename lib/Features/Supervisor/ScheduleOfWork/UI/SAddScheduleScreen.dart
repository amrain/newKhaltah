import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Supervisor/ScheduleOfWork/SScheduleProvider.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:khaltah/Features/Widgets/imageContractWidget.dart';
import 'package:khaltah/Models/AllContractsModel.dart';
import 'package:provider/provider.dart';
import '../../../ColorUi.dart';

class SAddScheduleScreen extends StatelessWidget {
  // const SAddScheduleScreen({Key? key}) : super(key: key);
  Contract? contract;
  SAddScheduleScreen({required this.contract});

  @override
  Widget build(BuildContext context) {
    return Consumer<SScheduleProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('إضافة جدول اعمال',style: TextStyle(fontSize: 18.sp),),
            centerTitle: false,

          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: provider.ScheduleKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ImageContract(height: 30,),
                            SizedBox(width: 8.w,),
                            Text(contract?.code.toString()??'',style: TextStyle(fontSize: 18.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      TextFieldWidget(labelText: 'اسم العمل',
                        hintText: 'صب سقف',
                        controller: provider.name,
                        validator: provider.nullValidation,
                      ),
                      SizedBox(height: 25.h,),
                      TextFieldWidget(hintText: '1-1-2022',
                        labelText: 'تاريخ العمل',
                        controller: provider.date,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.datetime,
                      ),
                      SizedBox(height: 25.h,),
                      TextFieldWidget(hintText: 'example@mail.com',
                        labelText: 'البريد الإلكتروني',
                        controller: provider.email,
                        validator: provider.emailValidation,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 30.h,),
                      InkWell(
                        onTap: (){
                          if(provider.ScheduleKey!.currentState!.validate()){
                            provider.ScheduleStore(contract!.id.toString());
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
    );
  }
}

