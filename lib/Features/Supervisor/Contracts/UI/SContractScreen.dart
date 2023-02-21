import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Features/Screens/Contracts/UI/ViewPDFScreen.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Models/AllContractsModel.dart';
import 'package:provider/provider.dart';

import '../../../ColorUi.dart';


class SContractScreen extends StatefulWidget {
  const SContractScreen({Key? key}) : super(key: key);
  @override
  _SContractScreenState createState() => _SContractScreenState();
}
enum OK {Yes,No,Rev}
class _SContractScreenState extends State<SContractScreen> {
  // int api = 2;
  // int _currentStep = 0;
  OK? _ok;
  bool value = false;

  int select = 1;
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return  Consumer<ContractsProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('العقود',style: TextStyle(fontSize: 18.sp),),
            centerTitle: false,
          ),
          body:
          provider.loading?
              //loading
              Center(child: LoadingWidget())
          :
              //not loading

          //cancel contract
          provider.contractStatus!.status == 4?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/Group3194.svg'),
                        SizedBox(width: 20.w,),
                        Text(provider.contractStatus?.code??'',style: TextStyle(color: ColorUi.mainColor,fontSize: 18.sp),),
                      ],),
                  ),
                  SizedBox(height: 100.h,),
                  Image.asset('assets/images/icons8-cancel-67.png'),
                  SizedBox(height: 15.h,),
                  Text('تم رفض المشروع من قبل العميل'),

                ],
              )
          :
          //accept contract
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                  SvgPicture.asset('assets/images/Group3194.svg',color: ColorUi.mainColor,),
                  SizedBox(width: 20.w,),
                  Text(provider.contractStatus?.code??'',style: TextStyle(color: ColorUi.mainColor,fontSize: 18.sp),),
                ],),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(11.r)),
                    border: Border.all(color: ColorUi.Color2)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            select = 1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: select==1 ? ColorUi.Color2 : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: Text('حالة الطلب',
                            style: TextStyle(color: select==1 ? Colors.white : Colors.black),),
                        ),
                      ),
                    ),

                    (provider.contractStatus!.status == 2)?
                    Expanded(
                      //open
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            select = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: select==2 ? ColorUi.Color2 : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: Text('المخالصة النهائية',
                            style: TextStyle(color: select==2 ? Colors.white : Colors.black),),
                        ),
                      ),
                    )
                    :
                    (provider.contractStatus!.status == 5)?
                    Expanded(
                      //open
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            select = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: select==2 ? ColorUi.mainColor : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: Text('المخالصة النهائية',
                            style: TextStyle(color: select==2 ? Colors.white : Colors.black),),
                        ),
                      ),
                    )
                    :
                    (provider.contractStatus!.status == 6)?
                    Expanded(
                      //open
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            select = 2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          height: 50.h,
                          // width: MediaQuery.of(context).size.width/2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: select==2 ? ColorUi.mainColor : Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          ),
                          child: Text('المخالصة النهائية',
                            style: TextStyle(color: select==2 ? Colors.white : Colors.black),),
                        ),
                      ),
                    )
                    :
                        //close
                    Expanded(
                        child: GestureDetector(
                          onTap: (){
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'المخالصة غير متاحة',
                              desc: 'يجب اكتمال حالة الطلب اولا',
                              btnOkText: 'موافق',
                              btnOkOnPress: () {},
                            ).show();
                          },
                          child: Container(
                            alignment: Alignment.center,
                              child: Text('المخالصة النهائية')),
                        )),
                  ],
                ),
              ),
              select==1?
              Expanded(
                child: Column(
                  children: [
                    Stepper(
                      type: StepperType.vertical,
                      physics: ScrollPhysics(),
                      currentStep: provider.currentStep,
                      onStepTapped: (step) => provider.tapped(step),
                      // onStepContinue:  continued,
                      // onStepCancel: cancel,
                      controlsBuilder: (BuildContext context, ControlsDetails details) {
                        return SizedBox();
                      },
                      steps: <Step>[
                        Step(
                          title: new Text('تم'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('تم تعبئة اركان العقد من قبل العميل ',style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/Group2904.svg'),
                                  SizedBox(width: 10.w,),
                                  GestureDetector(
                                    onTap: (){
                                      log('pdf');
                                      log(provider.contractStatus!.contractFile!);
                                      AppRouter.NavigatorToWidget(PDFViewScreen(provider.contractStatus!.contractFile!));
                                    },
                                      child: Text('الاطلاع علي العقد ')),
                                ],
                              ),
                            ],
                          ),
                          isActive: provider.currentStep == 0,
                          state: provider.contractStatus!.status! >= 0 ?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: new Text('معتمد من قبل الادارة'),
                          content: Column(
                            children: <Widget>[
                              Text("تم عرض السعر ${provider.contractStatus!.price.toString()} من قبل مؤسسة خلطه للمقاولات العامة ",style: TextStyle(color: Colors.grey),),
                              // SizedBox(height: 10.h,),
                              // Row(
                              //   children: [
                              //     SvgPicture.asset('assets/images/Group2904.svg'),
                              //     SizedBox(width: 10.w,),
                              //     Text('الاطلاع علي العقد '),
                              //   ],
                              // ),
                            ],
                          ),
                          isActive: provider.currentStep == 1,
                          state: provider.contractStatus!.status! >= 1 ?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: new Text('معتمد من قبل العميل'),
                          content:
                              Provider.of<AuthProvider>(context,listen: false).User.type == "3" ?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(provider.content,style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 10.h,),
                              provider.contractStatus!.status == 1?
                              Column(
                                children: [
                                  Row(children: [
                                    Radio<OK>(
                                      value: OK.Yes,
                                      groupValue: _ok,
                                      activeColor: ColorUi.mainColor,

                                      onChanged: (OK? value) {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.info,
                                          animType: AnimType.rightSlide,
                                          title: 'تأكيد',
                                          desc: 'هل انت موافق على السعر المقدم من المؤسسة ؟',
                                          btnOkText: 'موافق',
                                          btnCancelText: 'الغاء',
                                          btnOkOnPress: () {
                                            provider.updateContractStatus(provider.contractStatus!.id!, "2");
                                          },
                                          btnCancelOnPress: (){
                                            setState(() {
                                              _ok = null;
                                            });

                                          }
                                        ).show();
                                        setState(() {
                                          _ok = value;
                                        });
                                      },
                                    ),
                                    Text('موافقة',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),),
                                  ],
                                  ),
                                  Row(children: [
                                    Radio<OK>(
                                      value: OK.Rev,
                                      groupValue: _ok,
                                      activeColor: ColorUi.mainColor,
                                      onChanged: (OK? value) {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.info,
                                            animType: AnimType.rightSlide,
                                            title: 'تأكيد',
                                            desc: 'هل تريد مراجعة السعر المقدم من المؤسسة؟',
                                            btnOkText: 'مراجعة',
                                            btnCancelText: 'الغاء',
                                            btnOkOnPress: () {
                                              provider.updateContractStatus(provider.contractStatus!.id!, "3");
                                            },
                                            btnCancelOnPress: (){
                                              setState(() {
                                                _ok = null;
                                              });

                                            }
                                        ).show();
                                        setState(() {
                                          _ok = value;
                                        });
                                      },
                                    ),
                                    Text('مراجعة',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),)
                                  ],),
                                  Row(children: [
                                    Radio<OK>(
                                      value: OK.No,
                                      groupValue: _ok,
                                      activeColor: ColorUi.mainColor,
                                      onChanged: (OK? value) {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.info,
                                            animType: AnimType.rightSlide,
                                            title: 'تأكيد',
                                            desc: 'هل تريد رفض السعر المقدم من المؤسسة؟',
                                            btnOkText: 'رفض',
                                            btnCancelText: 'الغاء',
                                            btnOkOnPress: () {
                                              provider.updateContractStatus(provider.contractStatus!.id!, "4");
                                            },
                                            btnCancelOnPress: (){
                                              setState(() {
                                                _ok = null;
                                              });

                                            }
                                        ).show();
                                        setState(() {
                                          _ok = value;
                                        });
                                      },
                                    ),
                                    Text('رفض',style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                    ),),
                                  ],
                                  ),

                                ],

                              )
                              :Container(),
                            ],
                          )
                                  :
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                               provider.contractStatus!.status! == 2 ? "تم الموافقة من قبل العمل" :
                               provider.contractStatus!.status! == 3 ? "تم طلب المراجعة من قبل العمل" :
                               provider.contractStatus!.status! == 4 ? "تم رفض من قبل العمل" :
                               provider.contractStatus!.status! == 1 ? "في إنتظار موافقة العميل ..." : "تم الموافقة من قبل العمل"
                              ),
                              Container()
                            ],
                          )
                          ,
                          isActive: provider.currentStep == 2,
                          state: provider.contractStatus!.status! >= 1 ?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: new Text('معتمد نهائي'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('تم  الموافقة  النهائية ',style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/images/Group2904.svg'),
                                  SizedBox(width: 10.w,),
                                  GestureDetector(
                                      onTap: (){
                                        log('pdf');
                                        log(provider.contractStatus!.contractFile!);
                                        AppRouter.NavigatorToWidget(PDFViewScreen(provider.contractStatus!.contractFile!));
                                      },
                                      child: Text('الاطلاع علي العقد ')),
                                ],
                              ),
                            ],
                          ),
                          isActive: provider.currentStep == 3,
                          state: provider.contractStatus!.status! == 2 || provider.contractStatus!.status! > 4?
                          StepState.complete : StepState.disabled,
                        ),
                        Step(
                          title: new Text('نهاية العقد'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text('المخالصة النهائية',style: TextStyle(color: Colors.grey),),
                              SizedBox(height: 10.h,),
                              Text('كل التمنيات لك بالتوفيق والنجاح',style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          isActive: provider.currentStep == 4,
                          state: provider.contractStatus!.status! == 6 ?
                          StepState.complete : StepState.disabled,
                        ),
                      ],
                    ),
                  ],
                ),
              )
              :
              Expanded(
                 child: SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: 150.w,
                           padding: EdgeInsets.all(8),
                           height: 40.h,
                           // width: MediaQuery.of(context).size.width/2,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             color: const Color(0xff808000),
                             borderRadius: BorderRadius.all(Radius.circular(25.r)),
                           ),
                           child: const Text('المخالصة النهائية',
                             style: TextStyle(color: Colors.white),),
                         ),
                         SizedBox(height: 15.h,),
                         Row(
                           children: [
                             const Text('أقر انا الطرف الأول: '),
                             SizedBox(width: 5.w,),
                             const Text('عبدالله محمد أحمد')
                           ],
                         ),
                         SizedBox(height: 5.h,),
                         Row(
                           children: [
                             const Text('الجنسية: '),
                             SizedBox(width: 5.w,),
                             const Text('سعودي')
                           ],
                         ),
                         SizedBox(height: 5.h,),
                         Row(
                           children: [
                             const Text('حامل الهوية: '),
                             SizedBox(width: 5.w,),
                             const Text('1144895633')
                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Text('بان مؤسسة خلطه للمقاولات العامة قد انهت كافة الاعمال المتعلقة بالعقد  رقم    (001233)',
                         style: TextStyle(height: 1.5.h),),
                         SizedBox(height: 10.h,),
                         Text('كما تشهد مؤسسة خلطه للمقاولات العامة بانها استلمت كافة حقوقها المالية من الطرف الاول ولا يحق لأي طرف من الطرفين المنازعة بعد هذه المخالصة امام أي جهة كانت',
                           style: TextStyle(height: 1.5.h),),
                         SizedBox(height: 25.h,),
                         Container(
                           width: 100.w,
                           padding: EdgeInsets.all(8),
                           height: 40.h,
                           // width: MediaQuery.of(context).size.width/2,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                             color:  ColorUi.mainColor,
                             borderRadius: BorderRadius.all(Radius.circular(25.r)),
                           ),
                           child: const Text('ملاحظة',
                             style: TextStyle(color: Colors.white),),
                         ),
                         SizedBox(height: 15.h,),
                         const ListTile(
                           leading: Icon(Icons.circle,color: Color(0xff808000),),
                           title: Text('الموافقة الالكترونية على  المخالصة النهائية تعتبر  بمثابة التوقيع الشخصي وملزمة لحامل هذا السند قانونيا وقضائيا',
                           style: TextStyle(color: Color(0xff808000)),),
                         ),
                         SizedBox(height: 10.h,),
                         const ListTile(
                           leading: Icon(Icons.circle,color: Color(0xff808000),),
                           title: Text('لا يتم تسليم اي مبلغ مالي لاي عامل يقوم بتنفيذ الاعمال',
                             style: TextStyle(color: Color(0xff808000)),),
                         ),
                         SizedBox(height: 25.h,),
                         provider.contractStatus!.status! == 2?
                         Column(
                           children: [
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
                                  Text(
                                   'الموافقة',
                                   style: TextStyle(fontSize: 17.0,color: ColorUi.mainColor),
                                 ),




                               ],
                             ),
                             SizedBox(height: 10.h,),
                             InkWell(
                               onTap: (){
                                 if(value){
                                   provider.updateContractStatus(provider.contractStatus!.id!, "5");
                                 }
                                 else{
                                   AwesomeDialog(
                                     context: context,
                                     dialogType: DialogType.info,
                                     animType: AnimType.rightSlide,
                                     title: 'تأكيد',
                                     desc: 'يرجى الموافقة على المخالصة النهائية',
                                     btnOkText: 'موافق',
                                     btnOkOnPress: () {},
                                   ).show();
                                 }

                               },
                               child: Container(
                                 height: 48.h,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color:  ColorUi.mainColor,
                                   borderRadius: BorderRadius.circular(10),

                                 ),
                                 child: Text('ارسال',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                               ),
                             ),
                           ],
                         )
                         :SizedBox()
                         ,


                       ],
                     ),
                   ),
                 ),
               )


            ],
          ),

        );
      }
    );
  }



}
