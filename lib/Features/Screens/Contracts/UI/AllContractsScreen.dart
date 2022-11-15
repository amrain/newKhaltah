import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features//Widgets/TextFieldWidget.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

import 'ContractScreen.dart';


class AllContractsScreen extends StatelessWidget {
  const AllContractsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContractsProvider>(
      builder: (context,provider,x) {
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
                provider.loading?
                Center(child: LoadingWidget())
                    :
                provider.contracts?.length == 0 ?
                  Text('لا يوجد عقود')
                    :
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                      itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        provider.getContractStatus(provider.contracts![index].id!);
                        AppRouter.NavigatorToWidget(ContractScreen());
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
                            Text(provider.contracts?[index].code??'',style: TextStyle(fontSize: 18.sp),)
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
