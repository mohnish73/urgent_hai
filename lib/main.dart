import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/routes/routes_app.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleWH: () => false,

      child: MaterialApp.router(
        title: 'Urgent hai',
        routerConfig: router,
        theme: ThemeData(
          textTheme: GoogleFonts.urbanistTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
        ),

      ),
    );
  }
}


