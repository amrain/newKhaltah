import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ViewVideo extends StatelessWidget {
  // const ViewVideo({Key? key}) : super(key: key);
  int index;
  ViewVideo({required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<FollowUpProvider>(
      builder: (context,provider,x) {
        return WillPopScope(
            onWillPop: () {
              if(Navigator.canPop(context) || provider.controllersVideo[provider.followUp![index].name.toString()]!.value.isPlaying) {
                provider.controllersVideo[provider.followUp![index].name.toString()]!.pause();
                AppRouter.popFromWidget();
                return Future.value(false);
              }
              else{
                return Future.value(false);
              }
            },
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: InkWell(
                onTap: (){
                  if (provider.controllersVideo[provider.followUp![index].name.toString()]!.value.isPlaying) {
                    provider.controllersVideo[provider.followUp![index].name.toString()]!.pause();
                  } else {
                    provider.controllersVideo[provider.followUp![index].name.toString()]!.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: provider.controllersVideo[provider.followUp![index].name.toString()]!.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(provider.controllersVideo[provider.followUp![index].name.toString()]!),
                      provider.controllersVideo[provider.followUp![index].name.toString()]!.value.isPlaying?
                      SizedBox() :
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
        );
      }
    );
  }
}
