import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Supervisor/WorkAndBill/UI/SAddInvoiceScreen.dart';
import 'package:khaltah/Models/AllContractsModel.dart';

import 'SAddWorkScreen.dart';

class SWorkAndBillScreen extends StatelessWidget {
  // const SWorkAndBillScreen({Key? key}) : super(key: key);
  Contract contract;
  SWorkAndBillScreen ({required this.contract});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('الاعمال والفواتير',style: TextStyle(fontSize: 18.sp),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/images/Group979.svg',height: 30.h,),
                  SizedBox(width: 8.w,),
                  Text(contract.code.toString(),style: TextStyle(fontSize: 18.sp),)
                ],
              ),
            ),
            SizedBox(height: 25.h,),
            GestureDetector(
              onTap: (){
                AppRouter.NavigatorToWidget(SAddWorkScreen(contract: contract,));
              },
              child: Container(
                alignment: Alignment.centerRight,
                height: 50.h,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("إضافة عمل",style: TextStyle(fontSize: 22.sp),),
              ),
            ),
            SizedBox(height: 5.h,),
            GestureDetector(
              onTap: (){
                AppRouter.NavigatorToWidget(SAddInvoiceScreen(contract: contract,));
              },
              child: Container(
                alignment: Alignment.centerRight,
                height: 50.h,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("إضافة فاتورة",style: TextStyle(fontSize: 22.sp),),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
