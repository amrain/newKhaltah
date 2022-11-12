import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/Features/Screens/Bills/OneBillScreen.dart';
import '../../../AppRouter.dart';
import '../../Widgets/TextFieldWidget.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text('الفواتير',style: TextStyle(fontSize: 18.sp),),
        ),
      body: SafeArea(
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
                  Text('001224',style: TextStyle(fontSize: 12.sp),)
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
                    itemCount: Bills.length+1,
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
                              // showDialog(context: AppRouter.navKey.currentContext!, builder: (context){
                              //   return Dialog(
                              //
                              //     child:
                              //     Image.asset('assets/images/022.png',fit: BoxFit.fill,)
                              //
                              //     ,
                              //   );
                              // });
                              AppRouter.NavigatorToWidget(OneBillScreen());





                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/022.png',width: 150.w,height: 190.h,fit: BoxFit.fill,),
                                Text(Bills[index-1],style: TextStyle(fontSize: 10.sp,height: 2.h),),
                                Row(
                                  children: [
                                    Text('تاريخ الفاتورة',style: TextStyle(fontSize: 10.sp),),
                                    SizedBox(width: 5.w,),
                                    Text('15/12/2022',style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
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
}
