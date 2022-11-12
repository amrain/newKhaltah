import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/ProjectsHelper.dart';
import 'package:khaltah/Models/AllProjectsModal.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';

class HomeProvider extends ChangeNotifier{
  HomeProvider(){
    getAllProjects();
  }

  bool openAccessory = false;
  bool openDetails = false;

  OpenedAccessory(){
    openAccessory = true;
    notifyListeners();
  }
  OpenedDetails(){
    openDetails = true;
    notifyListeners();
  }

   List<Project> ProjectsTasheed = [];
   List<Project> ProjectsTashteb = [];
   List<Project> AllProjects = [];
   List<Section> sections = [];

  getAllProjects()async{
    AllProjectsModal allProjects = await HomeHelper.homeHelper.getAllProjects();
    AllProjects = allProjects.data!;
    ProjectsTasheed = AllProjects.where((element) {
      return element.type! == "1";
    }).toList();
    ProjectsTashteb = AllProjects.where((element) {
      return element.type! == "2";
    }).toList();
    notifyListeners();
  }

  getSections(String id)async {
    AllSectionsModel allSectionsModel = await HomeHelper.homeHelper.getSection(id);
    sections = allSectionsModel.data!;
    notifyListeners();
  }
}