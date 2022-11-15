import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/about_as_helper.dart';
import 'package:khaltah/Models/AboutAsModel.dart';

class AboutUsProvider extends ChangeNotifier{
  AboutUsProvider(){
    aboutUs();
    print(whoWe);
    print(conditions);
  }
  String? whoWe;
  String? conditions;
  bool loading = false;
  aboutUs()async{
    loading = true;
    notifyListeners();
    AboutUs myAboutUs = await AboutAsHelper.aboutAsHelper.aboutUs();
    whoWe = myAboutUs.content;
    conditions = myAboutUs.termsConditions;
    loading = false;
    notifyListeners();
  }





}