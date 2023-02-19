import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/ProjectsHelper.dart';
import 'package:khaltah/Helper/SHomeHelper.dart';
import 'package:khaltah/Models/AllProjectsModal.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:khaltah/Models/DashboardModel.dart';

class SHomeProvider extends ChangeNotifier{
  SHomeProvider(){
    getDashboard();
  }
  bool loading = false;
  Dashboard? dashboard;
  getDashboard()async{
    try{
      loading = true;
      notifyListeners();
      DashboardModel dashboardModel =
          await SHomeHelper.sHomeHelper.getDashboard();
      dashboard = dashboardModel.data!;
      loading = false;
      notifyListeners();
      log('getDashboard');
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }


}