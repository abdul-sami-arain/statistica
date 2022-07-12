import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:statistica/controller/controllerr.dart';
import 'package:statistica/widgets/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context)=> ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LandingPage()
          ),
      ),
      designSize: Size(414, 914),
      );
  }
}