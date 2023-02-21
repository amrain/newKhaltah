import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Supervisor/WorkAndBill/SWorkAndBillProvider.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:khaltah/Features/Widgets/imageContractWidget.dart';
import 'package:khaltah/Models/AllContractsModel.dart';
import 'package:provider/provider.dart';
import '../../../ColorUi.dart';

class SAddWorkScreen extends StatelessWidget {
  // const SAddWorkScreen({Key? key}) : super(key: key);
  Contract contract;
  SAddWorkScreen ({required this.contract});
  @override
  Widget build(BuildContext context) {
    return Consumer<SWorkAndBillProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('إضافة عمل',style: TextStyle(fontSize: 18.sp),),
            centerTitle: false,

          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: provider.WorkKey,
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
                            Text(contract.code.toString(),style: TextStyle(fontSize: 18.sp),)
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h,),
                      TextFieldWidget(hintText: 'دهان بناية',
                        labelText: 'مسمى العمل',
                        controller: provider.nameWork,
                        validator: provider.nullValidation,
                      ),
                      SizedBox(height: 25.h,),
                      TextFieldWidget(hintText: '1-1-2022',
                        labelText: 'بداية العمل',
                        controller: provider.startDateWork,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.datetime,
                      ),
                      SizedBox(height: 25.h,),
                      TextFieldWidget(hintText: '30-1-2022',
                        labelText: 'نهاية العمل',
                        controller: provider.endDateWork,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.datetime,
                      ),
                      SizedBox(height: 15.h,),
                      Text('إضافة صور',style: TextStyle(fontSize: 18.sp),),
                      SizedBox(height: 15.h,),
                      SizedBox(
                        height: 180.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                          itemCount: provider.imagesWork.length+1,
                            itemBuilder: (context,index){
                              if(index == provider.imagesWork.length){
                                return GestureDetector(
                                  onTap: (){
                                    provider.filePickerImagesWork();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 180.h,
                                        width: 130.w,
                                        margin: EdgeInsets.only(left: 8.w),
                                        child: DottedBorder(
                                            color: Colors.grey.shade300,
                                            strokeWidth: 2,
                                            dashPattern:[4],
                                          child: Center(child: Icon(Icons.drive_folder_upload_outlined,color: ColorUi.Color2,size: 50.sp,)),),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              else{
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 180.h,
                                      width: 130.w,
                                      margin: EdgeInsets.only(left: 8.w),
                                      child: DottedBorder(
                                          color: Colors.grey.shade300,
                                          strokeWidth: 2,
                                          dashPattern:[4],
                                          child:  Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Center(
                                                  child: Image.file(File(provider.imagesWork[index].paths.last!.toString()),fit: BoxFit.cover,height: 180.h,width: 130.w,)),
                                              IconButton(onPressed: (){
                                                provider.imagesWork.removeAt(index);
                                                provider.notifyListeners();
                                              },
                                                  icon: Icon(Icons.delete_outline_outlined,color: Colors.red,size: 30.sp,))
                                            ],
                                          )),
                                    ),

                                  ],
                                );
                              }

                            }),
                      ),

                      SizedBox(height: 15.h,),
                      Text('إضافة فيديو',style: TextStyle(fontSize: 18.sp),),
                      SizedBox(height: 15.h,),
                      GestureDetector(
                        onTap: (){
                          provider.filePickerVideoWork();
                        },
                        child: SizedBox(
                          height: 180.h,width: 130.w,
                          child: DottedBorder(
                              color: Colors.grey.shade300,
                              strokeWidth: 2,
                              dashPattern:[8],
                              child:
                              provider.uint8listA != null?
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.memory(provider.uint8listA as Uint8List,fit: BoxFit.cover,height: 180.h,width: 130.w,),
                                  IconButton(onPressed: (){
                                    provider.videoWork = null;
                                    provider.uint8listA = null;
                                    provider.notifyListeners();
                                  },
                                      icon: Icon(Icons.delete_outline_outlined,color: Colors.red,size: 30.sp,))
                                ],
                              ):
                              Center(child: Icon(Icons.upload_file_outlined,color: ColorUi.Color2,size: 50.sp,)),),
                        ),
                      ),


                      SizedBox(height: 30.h,),
                      InkWell(
                        onTap: (){
                          if(provider.WorkKey!.currentState!.validate()){
                            provider.AddWork(contract.id.toString());
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

