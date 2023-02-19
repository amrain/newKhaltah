import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Features/Screens/Contracts/ContractsProvider.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/SectionHelper.dart';
import 'package:khaltah/Models/AllSectionsModel.dart';
import 'package:khaltah/Models/SpecialConditionsModel.dart';
import 'package:provider/provider.dart';

class SectionProvider extends ChangeNotifier {
  List<Section> sections = [];
  List<Question> questions = [];
  bool openDocument = true;
  bool openSpecialConditions = false;
  bool openDetails = false;
  bool loading = false;



  OpenedAccessory(){
    openSpecialConditions = true;
    notifyListeners();
  }
  OpenedDetails(){
    openDetails = true;
    notifyListeners();
  }

  getSections(String id)async {
    try{
      loading = true;
      notifyListeners();
      AllSectionsModel allSectionsModel =
          await SectionHelper.sectionHelper.getSection(id);
      sections = allSectionsModel.data!;
      loading = false;
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
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
  TextEditingController cadastral_numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  FilePickerResult? cadastral_number_image;
  FilePickerResult? soil_report_image;
  FilePickerResult? approved_bill_of_quantities_image;
  FilePickerResult? PDF1;
  FilePickerResult? PDF2;
  FilePickerResult? PDF3;
  FilePickerResult? PDF4;

  String? idNewContracts;
  String? pathPDFContracts;

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
      case 'cadastral_number_image':
        cadastral_number_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg' , 'png'],
        );
        break;
      case 'soil_report_image':
        soil_report_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg' , 'png'],
        );
        break;
      case 'approved_bill_of_quantities_image':
        approved_bill_of_quantities_image = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf'],
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
    try{
      loading = true;
      notifyListeners();

      Response response = await SectionHelper.sectionHelper.contractsStore(
        project_id,
        section_id,
        construction_type,
        id_card_numberController.text,
        id_card_dateController.text,
        status_card_issuerController.text,
        Instrument_noController.text,
        Instrument_dateController.text,
        building_permit_numberController.text,
        license_dateController.text,
        engineering_office_nameController.text,
        engineer_nameController.text,
        engineer_phone_emailController.text,
        cadastral_numberController.text,
        neighborhoodController.text,
        status_card_image!,
        Instrument_image!,
        license_image!,
        cadastral_number_image!,
        soil_report_image!,
        approved_bill_of_quantities_image!,
        PDF1!,
        PDF2!,
        PDF3!,
        PDF4!,
      );
      loading = false;
      idNewContracts = response.data["data"]["id"].toString();
      pathPDFContracts = response.data["data"]["contract_file"].toString();
      notifyListeners();
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'تم بنجاح',
        desc: 'تم حفظ وثيقة العقد الاساسية',
        btnOkText: 'موافق',
        btnOkOnPress: () {},
      ).show();
      openDocument = false;
      openSpecialConditions = true;
      openDetails = false;
      Provider.of<ContractsProvider>(AppRouter.navKey.currentContext!,listen: false).getAllContracts();
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }

  getSpecialConditions(String id)async {
    try{
      SpecialConditionsModel allSpecialConditionsModel =
          await SectionHelper.sectionHelper.getSpecialConditions(id);
      questions = allSpecialConditionsModel.data!;
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }


  List<dynamic> answers = [];

  Map<String,dynamic> mapAnswers = {};



  storeSpecialConditions()async{
    try{
      answers = mapAnswers.values.toList();
      loading = true;
      notifyListeners();
      await SectionHelper.sectionHelper.storeSpecialConditions();
      loading = false;
      notifyListeners();
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'تم بنجاح',
        desc: 'تم حفظ ملحق الشروط الخاصة',
        btnOkText: 'موافق',
        btnOkOnPress: () {},
      ).show();
      openDocument = false;
      openSpecialConditions = false;
      openDetails = true;
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }




}