import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features//Widgets/TextFieldWidget.dart';
import 'package:khaltah/Features/Screens/Bills/BillsProvider.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Features/Widgets/imageContractWidget.dart';
import 'package:provider/provider.dart';

import 'FollowupProjectsScreen.dart';

class AllContractsForFollowUpScreen extends StatelessWidget {
  const AllContractsForFollowUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<FollowUpProvider,ContractsProvider>(
      builder: (context,provider,providerB,x) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: HeadShake(child: Text('متابعة الاعمال',style: TextStyle(fontSize: 18.sp),)),
          ),
          body: SafeArea(
            child: Column(
              children: [
                FadeInLeft(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(hintText: 'بحث',
                      suffix: IconButton(onPressed: (){
                        if(providerB.searchController.text.isEmpty){
                          providerB.getAllContracts();
                        }else
                          providerB.searchContracts();
                      },
                          icon: Icon(Icons.search)),
                      controller: providerB.searchController,
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                providerB.loading?
                Center(child: LoadingWidget())
                    :
                providerB.contracts?.length == 0 ?
                Text('لا يوجد عقود')
                    :
                Expanded(
                  child: FadeInRight(
                    child: ListView.builder(
                      itemCount: providerB.contracts?.length,
                        itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          // provider.getFollowUp(10);
                          log(providerB.contracts![index].id!.toString());
                          provider.getFollowUp(providerB.contracts![index].id!);
                          AppRouter.NavigatorToWidget(FollowupProjectsScreen());
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
                              ImageContract(),
                              SizedBox(width: 8.w,),
                              Text(providerB.contracts?[index].code??'',style: TextStyle(fontSize: 18.sp),)
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )

              ],
            ),
          ),
        );
      }
    );
  }
}
