import 'dart:io';

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

class SAddInvoiceScreen extends StatelessWidget {
  // const SAddInvoiceScreen({Key? key}) : super(key: key);
  Contract contract;
  SAddInvoiceScreen ({required this.contract});
  @override
  Widget build(BuildContext context) {
    return Consumer<SWorkAndBillProvider>(
      builder: (context,provider,x) {
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
                  key: provider.BillKey,
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
                      TextFieldWidget(hintText: 'اسم أو تاريخ الفاتورة',
                        labelText: 'اسم أو تاريخ الفاتورة',
                        controller: provider.nameBill,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 25.h,),
                      TextFieldWidget(hintText: '1-1-2022',
                        labelText: 'تاريح الفاتورة',
                        controller: provider.dateBill,
                        validator: provider.nullValidation,
                        textInputType: TextInputType.datetime,
                      ),
                      SizedBox(height: 15.h,),
                      Text('إضافة صورة',style: TextStyle(fontSize: 18.sp),),
                      SizedBox(height: 15.h,),
                      GestureDetector(
                        onTap: (){
                          provider.filePickerImageInvoice();
                        },
                        child:
                        provider.imageInvoice == null ?
                        SizedBox(
                          height: 180.h,width: 130.w,
                          child: DottedBorder(
                              color: Colors.grey.shade300,
                              strokeWidth: 2,
                              dashPattern:[8],
                              // child:  Center(child: SvgPicture.asset('assets/images/upload.svg',height: 50.h,))
                            child: Center(child: Icon(Icons.upload_file_outlined,color: ColorUi.Color2,size: 50.sp,)),
                          ),
                        )
                            :SizedBox(
                          height: 180.h,width: 130.w,
                              child: DottedBorder(
                              color: Colors.grey.shade300,
                              strokeWidth: 2,
                              dashPattern:[8],
                              child:  Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Center(child: Image.file(File(provider.imageInvoice!.paths.last.toString()),fit: BoxFit.cover,height: 180.h,width: 130.w,)),
                                  IconButton(onPressed: (){
                                    provider.imageInvoice = null;
                                    provider.notifyListeners();
                                  },
                                      icon: Icon(Icons.delete_outline_outlined,color: Colors.red,size: 30.sp,))
                                ],
                              )),
                            )

                        ,
                      ),
                      SizedBox(height: 30.h,),
                      InkWell(
                        onTap: (){
                          if(provider.BillKey!.currentState!.validate()){
                            provider.AddInvice(contract.id.toString());
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

