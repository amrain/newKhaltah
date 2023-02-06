import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/FollowUpHelper.dart';
import 'package:khaltah/Models/FollowUpModel.dart';
import 'package:video_player/video_player.dart';

class FollowUpProvider extends ChangeNotifier {
  bool loading = false;
  List<FollowUp>? followUp;
  // VideoPlayerController controllerVideo = VideoPlayerController.network();
  Map<String,VideoPlayerController> controllersVideo = {};

  getFollowUp(int idContract) async {
    loading = true;
    notifyListeners();
    FollowUpModel followUpModel = await FollowUpHelper.followUpHelper.getFollowUp(idContract);
    followUp = followUpModel.data;
    loading = false;
    notifyListeners();
    for(int i=0 ; i< followUp!.length ; i++){
      controllersVideo[followUp![i].name.toString()] = VideoPlayerController.network("${API.imageUrl}${followUp![i].workVideo}");
      controllersVideo[followUp![i].name.toString()]?.addListener(() {
        notifyListeners();
      });
      controllersVideo[followUp![i].name.toString()]?.setLooping(true);
      controllersVideo[followUp![i].name.toString()]?.initialize().then((_) {notifyListeners();} );
      controllersVideo[followUp![i].name.toString()]?.pause();
    }
  }
}