import 'package:gbs/global_export.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: black, // navigation bar color
    statusBarColor: primary, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Exam',
      fallbackLocale: const Locale('en', 'EN'),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes,
      initialRoute: AppRoutes.company,
    );
  }
}