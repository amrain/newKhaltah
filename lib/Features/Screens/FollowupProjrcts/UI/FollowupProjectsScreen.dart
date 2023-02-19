import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/UI/viewVideo.dart';
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
            child: ListView.builder(
                itemCount: provider.followUp!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 14.w,vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider.followUp![index].name!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
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
                          child:
                          provider.followUp![index].images!.length !=0?
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.followUp![index].images!.length,
                              itemBuilder: (context, indexImage) {
                                return GestureDetector(
                                  onTap: (){
                                    AppRouter.NavigatorToWidget(ViewPhotoScreen("${API.imageUrl}${provider.followUp![index].images![indexImage].image}"));
                                  },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                                      child: Image.network("${API.imageUrl}${provider.followUp![index].images![indexImage].image}"),
                                    ));
                              })
                          :Center(child: Text('لا يوجد صور'))                        ),
                        SizedBox(height: 10.h,),
                        Center(
                          child: InkWell(
                            onTap: (){
                              AppRouter.NavigatorToWidget(ViewVideo(index: index));
                            },
                            child: SizedBox(
                              height: 180.h,
                              child: AspectRatio(
                                aspectRatio: provider.controllersVideo[provider.followUp![index].name.toString()]!.value.aspectRatio,
                                child: Stack(
                                  children: [
                                    VideoPlayer(provider.controllersVideo[provider.followUp![index].name.toString()]!),
                                    AspectRatio(
                                      aspectRatio: provider.controllersVideo[provider.followUp![index].name.toString()]!.value.aspectRatio,
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.white.withOpacity(.4),
                                        child: Icon(Icons.play_circle_outlined,color: Colors.white,size: 45.sp,),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        const Divider(thickness: 1,),
                      ],
                    ),
                  );
                }),
          ),
        );
      }
    );
  }
}
