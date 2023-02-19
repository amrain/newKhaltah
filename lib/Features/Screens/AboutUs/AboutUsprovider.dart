import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/AboutAsHelper.dart';
import 'package:khaltah/Models/AboutAsModel.dart';

class AboutUsProvider extends ChangeNotifier{

  String? whoWe;
  String? conditions;
  bool loading = false;

  aboutUs()async{
    try{
      loading = true;
      notifyListeners();

      AboutUs myAboutUs = await AboutAsHelper.aboutAsHelper.aboutUs();
      whoWe = myAboutUs.content;
      conditions = myAboutUs.termsConditions;

      loading = false;
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }





}