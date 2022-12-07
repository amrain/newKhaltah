import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/ColorUi.dart';

class FileButton extends StatelessWidget {
  // const FileButton({Key? key}) : super(key: key);
  String content;
  FilePickerResult? file;
  FileButton({required this.content,required this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(8),
      height: 50.h,
      width: 1.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorUi.Color2,width: .5)
      ),
      child: Row(
        children: [
          Icon(Icons.add),
          SizedBox(width: 8.w,),
          Expanded(
            child: Text(
                file == null?
                content
                    : file?.names.toString()??'',overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
