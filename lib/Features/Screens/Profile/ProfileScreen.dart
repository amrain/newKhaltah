import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:khaltah/Features/Screens/Authentication/AuthProvider.dart';
import 'package:khaltah/Features/Screens/Profile/ProfileProvider.dart';
import 'package:khaltah/Helper/API.dart';
import 'package:provider/provider.dart';

import '../../ColorUi.dart';
import '../../Widgets/LoadingWidget.dart';
import '../../Widgets/TextFieldWidget.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text(provider.enable?'تعديل الملف الشخصي':'الملف الشخصي',style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.normal),),
            elevation: 0,
            centerTitle: true,
            backgroundColor: provider.loading? Colors.white:Color(0xff1B7AA7).withOpacity(.2),
            foregroundColor: Colors.black,
            actions: [IconButton(
                icon: Icon(Icons.settings), onPressed: () {
                  provider.enable = true;
                  provider.notifyListeners();
            },)],

          ),
          body:
          provider.loading?
          Center(child: LoadingWidget())
              :
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: Color(0xff1B7AA7).withOpacity(.2),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.r),bottomLeft: Radius.circular(25.r))
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h,),
                        Stack(
                          children: [
                            provider.userImage == null ?
                            CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage("${API.imageUrl}${provider.appUser.image}"),
                            ) :
                            CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.white,
                              backgroundImage: FileImage(File(provider.userImage!.paths.last.toString())),
                            )
                            ,
                            provider.enable?
                            CircleAvatar(
                              radius: 60.r,
                              backgroundColor: Colors.black26,
                              child: InkWell(
                                onTap: (){
                                  provider.filePicker();
                                },
                                  child: SvgPicture.asset('assets/images/Camera.svg')),
                            )
                            :SizedBox(),
                          ],
                        ),

                        SizedBox(height: 30.h,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(2,2),
                                  color: Colors.grey,
                                  blurRadius: 2,
                                )
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h,),
                              const Text('البيانات الشخصية',style: TextStyle(color: Colors.red),),
                              SizedBox(height: 20.h,),
                              TextFieldWidget(
                                labelText: 'الاسم ثلاثي',
                                hintText: 'محمد محمود البديري ',
                                controller: provider.nameController,
                                enabled: provider.enable,
                              ),
                              SizedBox(height: 20.h,),
                              TextFieldWidget(
                                labelText: 'البريد الإلكتروني',
                                hintText: 'example@mail.com',
                                controller: provider.emailController,
                                enabled: provider.enable,
                              ),
                              SizedBox(height: 20.h,),
                              TextFieldWidget(
                                labelText: 'رقم الهاتف',
                                hintText: '0096655546665',
                                controller: provider.phoneController,
                                enabled: provider.enable,
                              ),
                              SizedBox(height: 20.h,),
                              TextFieldWidget(
                                labelText: 'المدينة ',
                                hintText: 'مكة',
                                controller: provider.cityController,
                                enabled: provider.enable,
                              ),
                              SizedBox(height: 20.h,),

                            ],
                          ),
                        ),
                        SizedBox(height: 30.h,),
                        provider.enable?
                        InkWell(
                          onTap: ()async{
                            await provider.updateDataUser();

                          },
                          child: Container(
                            height: 48.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:  ColorUi.mainColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 3),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Text('حفظ',style: TextStyle(fontSize: 18.sp,color: Colors.white),),
                          ),
                        )
                        :SizedBox(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
