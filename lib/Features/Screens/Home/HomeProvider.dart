import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/ProjectsHelper.dart';
import 'package:khaltah/Models/AllProjectsModal.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';

class HomeProvider extends ChangeNotifier{
  HomeProvider(){
    getAllProjects();
  }



   List<Project> ProjectsTasheed = [];
   List<Project> ProjectsTashteb = [];
   List<Project> AllProjects = [];


  getAllProjects()async{
    try{
      AllProjectsModal allProjects =
          await HomeHelper.homeHelper.getAllProjects();
      AllProjects = allProjects.data!;
      ProjectsTasheed = AllProjects.where((element) {
        return element.type! == "1";
      }).toList();
      ProjectsTashteb = AllProjects.where((element) {
        return element.type! == "2";
      }).toList();
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      // loading = false;
      // notifyListeners();
    }
  }


}