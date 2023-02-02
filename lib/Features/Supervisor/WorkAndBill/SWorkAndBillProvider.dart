import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/SWorkAndInvoiceHelper.dart';

class SWorkAndBillProvider extends ChangeNotifier {
  GlobalKey<FormState>? BillKey = GlobalKey();
  TextEditingController nameBill = TextEditingController();
  TextEditingController dateBill = TextEditingController();
  FilePickerResult? imageInvoice;

  GlobalKey<FormState>? WorkKey = GlobalKey();
  TextEditingController nameWork = TextEditingController();
  TextEditingController startDateWork = TextEditingController();
  TextEditingController endDateWork = TextEditingController();
  FilePickerResult? VideoWork;
  bool loading = false;
  FilePickerResult? oneImage ;
  List<File> imagesWork = [];

  filePickerImageInvoice()async{
    imageInvoice = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg' , 'png'],
    );
    notifyListeners();
  }

  filePickerImagesWork()async{
    oneImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg' , 'png'],
    );
    File Fileone = File(oneImage!.paths.last.toString());
    log(oneImage!.names.last.toString());
    imagesWork.add(File(oneImage!.paths.last.toString()));
    log(imagesWork.length.toString()??'no 0');
    notifyListeners();
  }

  filePickerVideoWork()async{
    VideoWork = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );
    notifyListeners();
  }



  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}


  AddInvice(String id)async{
    loading = true;
    notifyListeners();
    await SWorkAndInvoiceHelper.sWorkAndInvoiceHelper.AddInvoice(id, nameBill.text, dateBill.text);
    // log(response.data.toString());
    loading = false;
    notifyListeners();
    AwesomeDialog(
      context: AppRouter.navKey.currentContext!,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'تم الارسال',
      desc: 'تم إضافة الفاتورة',
      btnOkText: 'موافق',
      btnOkOnPress: () {
        nameBill.clear();
        dateBill.clear();
        imageInvoice = null;
        notifyListeners();
      },
    ).show();
  }

  AddWork(String id)async{
    loading = true;
    notifyListeners();
    await SWorkAndInvoiceHelper.sWorkAndInvoiceHelper.AddWork(id, nameWork.text, startDateWork.text, endDateWork.text);
    log(imagesWork.length.toString() ?? 'noooooooooooo');
    loading = false;
    notifyListeners();
    AwesomeDialog(
      context: AppRouter.navKey.currentContext!,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'تم الارسال',
      desc: 'تم إضافة الفاتورة',
      btnOkText: 'موافق',
      btnOkOnPress: () {
        nameBill.clear();
        dateBill.clear();
        imageInvoice = null;
        notifyListeners();
      },
    ).show();
  }


}