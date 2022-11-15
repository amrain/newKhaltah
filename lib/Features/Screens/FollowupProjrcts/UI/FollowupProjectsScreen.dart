import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Features/Widgets/ViewPhotoScreen.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:provider/provider.dart';

import '../../../ColorUi.dart';
import '../../../Widgets/TextFieldWidget.dart';

class FollowupProjectsScreen extends StatelessWidget {
  const FollowupProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FollowUpProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('متابعة الاعمال',style: TextStyle(fontSize: 18.sp),),
          ),
          body:
              provider.loading?
                  Center(child: LoadingWidget()):
              provider.followUp?.length == 0 ?
              Center(child:Text('لا يوجد أي أعمال')):
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextFieldWidget(hintText: 'رقم الطلب او الهوية',
                  //   suffix: IconButton(onPressed: (){},
                  //       icon: Icon(Icons.search)),
                  // ),
                  // SizedBox(height: 20.h,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: provider.followUp!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text(provider.followUp![index].name!,style: TextStyle(fontSize: 15.sp,height: 2.h),),

                                      Row(
                                        children: [
                                          Text('تاريخ الفاتورة',style: TextStyle(fontSize: 10.sp),),
                                          SizedBox(width: 5.w,),
                                          Text(provider.followUp![index].date!,style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                                        ],
                                      )
                                    ],
                                  ),
                                  // index==0?
                                  // Container(
                                  //   margin: EdgeInsets.all(5),
                                  //   padding: EdgeInsets.all(5),
                                  //   decoration: BoxDecoration(
                                  //       color: Color(0xffEEF7FC),
                                  //       borderRadius: BorderRadius.circular(10)
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: [
                                  //       SvgPicture.asset('assets/images/Group979.svg',height: 30.h,),
                                  //       Text(" "+'001244')
                                  //     ],
                                  //    ),
                                  // )
                                  // :const SizedBox(),
                                ],
                              ),
                              SizedBox(height: 15.h,),
                              SizedBox(
                                height: 120.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: provider.followUp![index].image!.length,
                                    itemBuilder: (context, indexImage) {
                                      return GestureDetector(
                                        onTap: (){
                                          AppRouter.NavigatorToWidget(ViewPhotoScreen("${API.imageUrl}${provider.followUp![index].image![indexImage].image}"));
                                        },
                                          child: Image.network("${API.imageUrl}${provider.followUp![index].image![indexImage].image}"));
                                    }),
                              ),
                              SizedBox(height: 15.h,),
                            ],
                          );
                        }),
                  ),
                  // SizedBox(height: 20.h,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: (){
                  //       },
                  //       child: Container(
                  //         height: 48.h,
                  //         width: 160.w,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           color:  ColorUi.mainColor,
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SvgPicture.asset('assets/images/print.svg'),
                  //             SizedBox(width: 10.w,),
                  //             Text('طباعه',style: TextStyle(fontSize: 15.sp,color: Colors.white),),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: (){
                  //       },
                  //       child: Container(
                  //         height: 48.h,
                  //         width: 55.w,
                  //         alignment: Alignment.center,
                  //         decoration: BoxDecoration(
                  //           color:  ColorUi.mainColor,
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SvgPicture.asset('assets/images/share.svg'),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )




                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
