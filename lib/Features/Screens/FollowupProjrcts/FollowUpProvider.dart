import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/FollowUpHelper.dart';
import 'package:khaltah/Models/FollowUpModel.dart';

class FollowUpProvider extends ChangeNotifier {
  bool loading = false;
  List<FollowUp>? followUp;

  getFollowUp(int idContract) async {
    loading = true;
    notifyListeners();
    FollowUpModel followUpModel = await FollowUpHelper.followUpHelper.getFollowUp(idContract);
    followUp = followUpModel.data;
    loading = false;
    notifyListeners();

  }
}