import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/Helper/SectionHelper.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:khaltah/Models/SpecialConditionsModel.dart';

class SectionProvider extends ChangeNotifier {
  List<Section> sections = [];
  List<Question> questions = [];
  bool openAccessory = false;
  bool openDetails = false;
  bool loading = false;



  OpenedAccessory(){
    openAccessory = true;
    notifyListeners();
  }
  OpenedDetails(){
    openDetails = true;
    notifyListeners();
  }

  getSections(String id)async {
    AllSectionsModel allSectionsModel = await SectionHelper.sectionHelper.getSection(id);
    sections = allSectionsModel.data!;
    notifyListeners();
  }
  String construction_type = '1';
  TextEditingController id_card_numberController = TextEditingController();
  TextEditingController id_card_dateController = TextEditingController();
  TextEditingController status_card_issuerController = TextEditingController();
  FilePickerResult? status_card_image;
  TextEditingController Instrument_noController = TextEditingController();
  TextEditingController Instrument_dateController = TextEditingController();
  FilePickerResult? Instrument_image;
  TextEditingController building_permit_numberController = TextEditingController();
  TextEditingController license_dateController = TextEditingController();
  FilePickerResult? license_image;
  TextEditingController engineering_office_nameController = TextEditingController();
  TextEditingController engineer_nameController = TextEditingController();
  TextEditingController engineer_phone_emailController = TextEditingController();
  FilePickerResult? PDF1;
  FilePickerResult? PDF2;
  FilePickerResult? PDF3;
  FilePickerResult? PDF4;


  filePicker(String fileName)async{
    switch(fileName)
    {
      case 'status_card_image':
        status_card_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg' , 'png'],
        );
         break;
      case 'Instrument_image':
        Instrument_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg' , 'png'],
        );
         break;
      case 'license_image':
        license_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg' , 'png'],
        );
        break;
      case 'PDF1':
        PDF1 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        break;
      case 'PDF2':
        PDF2 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        break;
      case 'PDF3':
        PDF3 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        break;
      case 'PDF4':
        PDF4 = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        break;
    }
    notifyListeners();
  }
  contractsStore(String project_id, String section_id) async {
    loading = true;
    notifyListeners();

    await SectionHelper.sectionHelper.contractsStore(
        project_id,
        section_id,
        construction_type,
        id_card_numberController.text,
        id_card_dateController.text,
        status_card_issuerController.text,
        // File(status_card_image?.files.single.path.toString()??''),
        Instrument_noController.text,
        Instrument_dateController.text,
        // File(Instrument_image?.files.single.path.toString()??''),
        building_permit_numberController.text,
        Instrument_dateController.text,
        // File(license_image?.files.single.path.toString()??''),
        engineering_office_nameController.text,
        engineer_nameController.text,
        engineer_phone_emailController.text,
    );
    loading = false;
    notifyListeners();

  }

  getSpecialConditions(String id)async {
    SpecialConditionsModel allSpecialConditionsModel = await SectionHelper.sectionHelper.getSpecialConditions(id);
    questions = allSpecialConditionsModel.data!;
    notifyListeners();
  }



}