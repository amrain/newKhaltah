import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:khaltah/AppRouter.dart';
import 'package:khaltah/Helper/AuthHelper.dart';
import 'package:string_validator/string_validator.dart';

import '../../../Models/AuthModel.dart';
import '../../Widgets/NavBarWidget.dart';

class AuthProvider extends ChangeNotifier{
  late AuthModel User;

  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  GlobalKey<FormState>? loginKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmationController = TextEditingController();
  GlobalKey<FormState>? registerKey = GlobalKey();

  TextEditingController forgetPasswordController = TextEditingController();
  GlobalKey<FormState>? forgetPasswordKey = GlobalKey();

  TextEditingController resetOldPassController = TextEditingController();
  TextEditingController resetNewPassController = TextEditingController();
  TextEditingController resetConfirmPassController = TextEditingController();
  GlobalKey<FormState>? resetPasswordKey = GlobalKey();

  bool loading = false;

  nullValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }}
  passwordValidation(String v){
    if(v.length < 6) {
      return 'كلمة المرور يجب ان تكون اكثر من 6 أحرف';
    }}
  passConfirm(String v){
    if(v.length < 6) {
      return 'كلمة المرور يجب ان تكون اكثر من 6 أحرف';
    }
    if(v != resetNewPassController.text) {
      return 'كلمة المرور غير متطابقة';
    }


  }
  emailValidation(String v){
    if(v.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    else if(!isEmail(v)) {
      return 'هذا البريد غير صحيح';
    }
  }
  
  login()async{
    loading = true;
    notifyListeners();
    User = await AuthHelper.authHelper.login(emailLoginController.text, passwordLoginController.text);
    loading = false;
    notifyListeners();

    if(User.status == true){
       AppRouter.NavigatorToWidgetWithReplacement(NavBarWidget());
     }
     else{
       AwesomeDialog(
         context: AppRouter.navKey.currentContext!,
         dialogType: DialogType.error,
         animType: AnimType.scale,
         title: 'خطأ',
         desc: 'يرجى كتابة البريد الإلكتروني وكلمة المرور بالشكل الصحيح',
         btnOkText: 'موافق',
         btnOkOnPress: () {},
       ).show();
     }

  }

  register()async{
    loading = true;
    notifyListeners();
    User = await AuthHelper.authHelper.register(
        nameController.text,
        emailController.text,
        phoneController.text,
        CityController.text,
        passwordController.text,
        password_confirmationController.text);
    loading = false;
    notifyListeners();
    if(User.status == true){
      AppRouter.NavigatorToWidgetWithReplacement(NavBarWidget());
    }
    else{
      AwesomeDialog(
        context: AppRouter.navKey.currentContext!,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'خطأ',
        desc: User.message,
        btnOkText: 'موافق',
        btnOkOnPress: () {},
      ).show();
    }

  }

  forgetPassword()async {
    loading = true;
    notifyListeners();
    await AuthHelper.authHelper.forgetPassword(forgetPasswordController.text);
    loading = false;
    notifyListeners();

  }

  resetPassword() async{
    loading = true;
    notifyListeners();
    AuthHelper.authHelper.resetPassword(resetOldPassController.text, resetNewPassController.text, resetConfirmPassController.text);
    loading = false;
    notifyListeners();
  }





}