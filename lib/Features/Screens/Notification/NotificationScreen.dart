import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/Screens/Notification/NotificationProvider.dart';
import 'package:khaltah/Features/Widgets/LoadingWidget.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context,provider,x) {
        return Scaffold(
          appBar: AppBar(
            title: Text('الاشعارات',style: TextStyle(fontSize: 18.sp),),
            centerTitle: false,
          ),
          body:
              provider.loading?
                  Center(child: LoadingWidget()):
          SafeArea(
            child: Expanded(
              child: ListView.builder(
                  itemCount: provider.notifications.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: provider.notifications[index].status == "1"? Colors.red.shade50:Colors.blue.shade50,
                            radius: 25.r,
                            child: Icon(Icons.notifications_on_outlined,
                              color: provider.notifications[index].status == "1"?
                            Colors.red:Colors.blue),
                          ),
                          title: Text(provider.notifications[index].message!,
                            style: TextStyle(height: 1.5),),
                          subtitle: Text(provider.notifications[index].createdAt.toString().split('T').first,style: TextStyle(height: 2),),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        );
      }
    );
  }
}



