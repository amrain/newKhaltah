import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/ColorUi.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  String? labelText;
  TextEditingController? controller;
  Widget? suffix;
  final Function? validator;
  int? maxLine;
  TextInputType? textInputType;
  bool? isPassword;
  bool? enabled;
  TextFieldWidget({
    required this.hintText,
    this.controller,
    this.suffix,
    this.validator,
    this.maxLine,
    this.textInputType,
    this.isPassword,
    this.labelText,
    this.enabled

  });
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: TextFormField(
        obscureText: isPassword??false,
        keyboardType: textInputType,
        enabled: enabled,

        maxLines: maxLine??1,
        validator: (x)=>validator!(x),
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        style: TextStyle(fontSize: 15.sp,color: Colors.black), //#AEBAF8
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorUi.Color2, width: .5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorUi.Color2, width: .5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ColorUi.Color2, width: .5),
          ),
          suffixIcon: suffix,


          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.sp,color: Colors.grey),
          labelText: labelText,

        ),

      ),
    );
  }
}
