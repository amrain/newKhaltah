import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khaltah/Features/ColorUi.dart';
import 'package:khaltah/Features/Screens/AboutUs/AboutUsprovider.dart';
import 'package:khaltah/Features/Screens/Authentication/UI/LoginScreen.dart';
import 'package:khaltah/Features/Screens/Bills/BillsProvider.dart';
import 'package:khaltah/Features/Screens/Profile/ProfileProvider.dart';
import 'package:khaltah/Features/Supervisor/Bond/SBondProvider.dart';
import 'package:khaltah/Features/Supervisor/ScheduleOfWork/SScheduleProvider.dart';
import 'package:khaltah/Helper/SScheduleHelper.dart';
import 'package:provider/provider.dart';
import 'AppRouter.dart';
import 'Features/Screens/Authentication/AuthProvider.dart';
import 'Features/Screens/ConnectUS/ConnectUSProvider.dart';
import 'Features/Screens/Contracts/ContractsProvider.dart';
import 'Features/Screens/FollowupProjrcts/FollowUpProvider.dart';
import 'Features/Screens/Home/HomeProvider.dart';
import 'Features/Screens/Home/Section/SectionProvider.dart';
import 'Features/Screens/Notification/NotificationProvider.dart';
import 'Features/Screens/SplachScreen.dart';
import 'Features/Supervisor/Home/SHomeProvider.dart';
import 'Features/Supervisor/WorkAndBill/SWorkAndBillProvider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'),Locale('ar')],
      path: 'assets/langs', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      startLocale : Locale('ar'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) {
            return HomeProvider();
          },),
        ChangeNotifierProvider<ContractsProvider>(
          create: (context) {
            return ContractsProvider();
          },),
        ChangeNotifierProvider<ConnectUSProvider>(
          create: (context) {
            return ConnectUSProvider();
          },),
        ChangeNotifierProvider<BillsProvider>(
          create: (context) {
            return BillsProvider();
          },),
        ChangeNotifierProvider<AboutUsProvider>(
          create: (context) {
            return AboutUsProvider();
          },),
        ChangeNotifierProvider<FollowUpProvider>(
          create: (context) {
            return FollowUpProvider();
          },),
        ChangeNotifierProvider<NotificationProvider>(
          create: (context) {
            return NotificationProvider();
          },),
        ChangeNotifierProvider<SectionProvider>(
          create: (context) {
            return SectionProvider();
          },),
        ChangeNotifierProvider<SHomeProvider>(
          create: (context) {
            return SHomeProvider();
          },),
        ChangeNotifierProvider<SBondProvider>(
          create: (context) {
            return SBondProvider();
          },),
        ChangeNotifierProvider<SScheduleProvider>(
          create: (context) {
            return SScheduleProvider();
          },),
        ChangeNotifierProvider<SWorkAndBillProvider>(
          create: (context) {
            return SWorkAndBillProvider();
          },),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) {
            return ProfileProvider();
          },),

      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
        builder: (context,child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            navigatorKey: AppRouter.navKey,
            theme: ThemeData(
              fontFamily: 'arabic',
              scaffoldBackgroundColor: Colors.white,

              appBarTheme: const AppBarTheme(

                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'arabic',
                  color: Colors.black,),
                centerTitle: false,
                elevation: 0,
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,

              ),
                textSelectionTheme: TextSelectionThemeData(cursorColor : ColorUi.Color2)
            ),
            home: SplashScreen(),
            routes: <String, WidgetBuilder> {
              '/login': (BuildContext context) => LoginScreen()
            },
          );
        }
      ),
    );
  }
}

