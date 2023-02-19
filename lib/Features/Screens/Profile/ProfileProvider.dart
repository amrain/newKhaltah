import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:khaltah/Helper/AuthHelper.dart';
import 'package:khaltah/Models/UserModel.dart';

class ProfileProvider extends ChangeNotifier{
  late AppUser appUser;
  bool enable = false;
  bool loading = false;

  FilePickerResult? userImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  filePicker()async{
    userImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg' , 'png'],
    );
    notifyListeners();
  }

  getDataUser()async{
    try{
      loading = true;
      notifyListeners();
      UserModel userModel = await AuthHelper.authHelper.getDataUser();
      appUser = userModel.data!;
      print(appUser.name);
      loading = false;
      nameController.text = appUser.name ?? '';
      emailController.text = appUser.email ?? '';
      phoneController.text = appUser.phone.toString() ?? '';
      cityController.text = appUser.city ?? '';
      notifyListeners();
    }
    catch(e){
      API.showErrorMsg();
      loading = false;
      notifyListeners();
    }
  }

  updateDataUser()async{
    try{
      loading = true;
      notifyListeners();
      await AuthHelper.authHelper.updateDataUser(
          nameController.text,
          emailController.text,
          phoneController.text,
          cityController.text,
          userImage);
      getDataUser();
      userImage = null;
      loading = false;
      enable = false;
      notifyListeners();
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'تم بنجاح',
        desc: 'تم تحديث الملف الشخصي',
        btnOkText: 'موافق',
        btnOkOnPress: () {
        },
      ).show();
    }
    catch(e){
      API.showErrorMsg();
      userImage = null;
      loading = false;
      enable = false;
      notifyListeners();
    }
  }


}