import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:khaltah/Features/Widgets/ViewPhotoScreen.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(provider.followUp![index].name!,style: TextStyle(fontSize: 18.sp,height: 2.h,fontWeight: FontWeight.bold),),
                              SizedBox(height: 10.h,),
                              Row(
                                children: [
                                  Text('تاريخ البدء',style: TextStyle(fontSize: 10.sp),),
                                  SizedBox(width: 5.w,),
                                  Text(provider.followUp![index].startDate!,style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                                ],
                              ),
                              SizedBox(height: 5.h,),
                              Row(
                                children: [
                                  Text('تاريخ النهاية',style: TextStyle(fontSize: 10.sp),),
                                  SizedBox(width: 5.w,),
                                  Text(provider.followUp![index].endDate!,style: TextStyle(color: Colors.grey,fontSize: 10.sp),),
                                ],
                              ),
                              SizedBox(height: 15.h,),
                              SizedBox(
                                height: 120.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: provider.followUp![index].images!.length,
                                    itemBuilder: (context, indexImage) {
                                      return GestureDetector(
                                        onTap: (){
                                          AppRouter.NavigatorToWidget(ViewPhotoScreen("${API.imageUrl}${provider.followUp![index].images![indexImage].image}"));
                                        },
                                          child: Image.network("${API.imageUrl}${provider.followUp![index].images![indexImage].image}"));
                                    }),
                              ),
                              SizedBox(
                                height: 150.h,
                                child: VideoProgressIndicator(
                                    VideoPlayerController.network("${API.imageUrl}${provider.followUp![index].workVideo!}")
                                      ..initialize().then((value) {
                                        provider.notifyListeners();
                                      }),  //video player controller
                                    allowScrubbing: false,
                                    colors:VideoProgressColors( //video player progress bar
                                      backgroundColor: Colors.redAccent,
                                      playedColor: Colors.green,
                                      bufferedColor: Colors.purple,
                                    )

                                ),
                              ),
                              SizedBox(height: 5.h,),
                              const Divider(thickness: 1,),
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
