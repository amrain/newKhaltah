import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Bills/BillsProvider.dart';
import 'package:khaltah/Features/Widgets/ViewPhotoScreen.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Features/Widgets/TextFieldWidget.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:provider/provider.dart';


class BillsScreen extends StatelessWidget {
  BillsScreen({Key? key}) : super(key: key);

  List <String> Bills = [
    'فاتورة 1',
    'فاتورة 2',
    'فاتورة 3',
    'فاتورة 4',
    'فاتورة 5',
  ];



  @override
  Widget build(BuildContext context) {
    return Consumer<BillsProvider>(
      builder: (context,provider,x) {
        return Scaffold(
            appBar: AppBar(
              title: Text('الفواتير',style: TextStyle(fontSize: 18.sp),),
            ),
          body:
              provider.loading?
              Center(child: LoadingWidget()):

                  provider.bills.length == 0 ?
                      Center(child:Text('لا يوجد أي فواتير')):
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldWidget(hintText: 'رقم الطلب او الهوية',
                    suffix: IconButton(onPressed: (){},
                        icon: Icon(Icons.search)),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/Group979.svg'),
                      SizedBox(width: 8.w,),
                      Text(provider.bills.first.contract!.code!,style: TextStyle(fontSize: 12.sp),)
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Text('الفواتير السابقة '),
                  SizedBox(height: 15.h,),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                            (.47.sw)/.3.sh,
                          crossAxisSpacing: 10.w,mainAxisSpacing: 10.h

                        ),
                        itemCount: provider.bills.length+1,
                        itemBuilder: (BuildContext ctx, index) {
                          return
                            index == 0?
                            Container(
                              margin: const EdgeInsets.all(8),
                              child: DottedBorder(
                                color: Colors.grey,
                                  padding: const EdgeInsets.all(6),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/images/upload.svg',height: 80.h,),
                                        Text('اضافة فاتورة ',style: TextStyle(height: 1.5),)
                                      ],
                                    ),
                                  )
                              ),
                            )
                                :
                            Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(
                              child: GestureDetector(
                                onTap: (){
                                  AppRouter.NavigatorToWidget(ViewPhotoScreen("${API.imageUrl}${provider.bills[index-1].image}"));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Image.network("${API.imageUrl}${provider.bills[index-1].image}",width: 150.w,height: 190.h,fit: BoxFit.fill,
                                    ),
                                    Text(provider.bills[index-1].name!,style: TextStyle(fontSize: 10.sp,height: 2.h),),
                                    Row(
                                      children: [
                                        Text('تاريخ الفاتورة',style: TextStyle(fontSize: 10.sp),),
                                        SizedBox(width: 5.w,),
                                        Text(provider.bills[index-1].date!,style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
