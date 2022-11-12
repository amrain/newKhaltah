import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشعارات',style: TextStyle(fontSize: 18.sp),),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Expanded(
          child: ListView(

            children: [
              InkWell(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.info,
                    animType: AnimType.rightSlide,
                    desc: 'يرجي العلم بانه يوم السبت الموافق 1111/1/11  ه  سيتم صب السقف ',
                    btnOkText: 'موافق',
                    btnCancelText: 'رفض',
                    btnOkOnPress: () {},
                    btnCancelOnPress: (){},
                  ).show();
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xffFFEBE6),
                        radius: 25.r,
                        child: Icon(Icons.notifications_on_outlined,color: Colors.red,),
                      ),
                      title: Text('يرجي العلم بانه يوم السبت الموافق 1111/1/11  ه  سيتم صب السقف ',
                      style: TextStyle(height: 1.5),),
                      subtitle: Text('قبل 5 دقائق',style: TextStyle(height: 2),),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffE1FAFF),
                      radius: 25.r,
                      child: Icon(Icons.notifications_on_outlined,color: Colors.blue,),
                    ),
                    title: Text('يرجي العلم بانه يوم السبت الموافق 1111/1/11  ه  سيتم صب السقف ',
                      style: TextStyle(height: 1.5),),
                    subtitle: Text('قبل 5 دقائق',style: TextStyle(height: 2),),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffFFEBE6),
                      radius: 25.r,
                      child: Icon(Icons.notifications_on_outlined,color: Colors.red,),
                    ),
                    title: Text('يرجي العلم بانه يوم السبت الموافق 1111/1/11  ه  سيتم صب السقف ',
                      style: TextStyle(height: 1.5),),
                    subtitle: Text('قبل 5 دقائق',style: TextStyle(height: 2),),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xffE1FAFF),
                      radius: 25.r,
                      child: Icon(Icons.notifications_on_outlined,color: Colors.blue,),
                    ),
                    title: Text('يرجي العلم بانه يوم السبت الموافق 1111/1/11  ه  سيتم صب السقف ',
                      style: TextStyle(height: 1.5),),
                    subtitle: Text('قبل 5 دقائق',style: TextStyle(height: 2),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
