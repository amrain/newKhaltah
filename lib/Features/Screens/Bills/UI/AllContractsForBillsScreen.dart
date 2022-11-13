import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features//Widgets/TextFieldWidget.dart';
import 'package:khaltah/Features/Screens/Bills/BillsProvider.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import 'BillsScreen.dart';




class AllContractsForBillsScreen extends StatelessWidget {
  const AllContractsForBillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<BillsProvider,ContractsProvider>(
      builder: (context,provider,providerB,x) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('العقود',style: TextStyle(fontSize: 18.sp),),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFieldWidget(hintText: 'بحث',
                    suffix: IconButton(onPressed: (){},
                        icon: Icon(Icons.search)),
                  ),
                ),
                SizedBox(height: 15.h,),
                providerB.loading?
                Center(child: LoadingWidget())
                :Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                      itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        provider.getBills(providerB.contracts![index].id!);
                        // provider.getBills(1);
                        AppRouter.NavigatorToWidget(BillsScreen());
                      },
                      child: Container(
                        height: 50.h,
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/images/Group979.svg',height: 50.h,),
                            SizedBox(width: 8.w,),
                            Text(providerB.contracts?[index].code??'',style: TextStyle(fontSize: 18.sp),)
                          ],
                        ),
                      ),
                    );
                  }),
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
