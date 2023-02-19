import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/SWorkAndInvoiceHelper.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class SWorkAndBillProvider extends ChangeNotifier {
  GlobalKey<FormState>? BillKey = GlobalKey();
  TextEditingController nameBill = TextEditingController();
  TextEditingController dateBill = TextEditingController();
  FilePickerResult? imageInvoice;

  GlobalKey<FormState>? WorkKey = GlobalKey();
  TextEditingController nameWork = TextEditingController();
  TextEditingController startDateWork = TextEditingController();
  TextEditingController endDateWork = TextEditingController();
  FilePickerResult? videoWork;
  bool loading = false;
  FilePickerResult? oneImage ;
  List<FilePickerResult> imagesWork = [];
  Uint8List? uint8listA;

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
    imagesWork.add(oneImage!);

    // File Fileone = File(oneImage!.paths.last.toString());
    log(oneImage!.names.last.toString());
    // imagesWork.add(File(oneImage!.paths.last.toString()));
    log(imagesWork.length.toString()??'no 0');
    notifyListeners();
  }

  filePickerVideoWork()async{
    videoWork = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );
      uint8listA =await VideoThumbnail.thumbnailData(
      video: videoWork?.paths.last.toString()??'',
      imageFormat: ImageFormat.PNG,
      maxWidth: 128, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      quality: 25,
    );
    notifyListeners();
  }



  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}


  AddInvice(String id)async{
    try{
      loading = true;
      notifyListeners();
      await SWorkAndInvoiceHelper.sWorkAndInvoiceHelper
          .AddInvoice(id, nameBill.text, dateBill.text);
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
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }

  AddWork(String id)async{
    try{
      loading = true;
      notifyListeners();
      await SWorkAndInvoiceHelper.sWorkAndInvoiceHelper.AddWork(
          id,
          nameWork.text,
          startDateWork.text,
          endDateWork.text,
          imagesWork,
          videoWork!);
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
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }


}