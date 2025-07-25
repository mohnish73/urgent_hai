import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:urgenthai/resoures/app_colors.dart';
import 'package:urgenthai/routes/routes_app.dart';
import 'package:urgenthai/screens/auth_screen/provider/auth_provider.dart';


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

      child: MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => AuthProvider()),

        ],

        child: MaterialApp.router(
          title: 'Urgent hai',
          routerConfig: router,
          theme: ThemeData(
            textTheme: GoogleFonts.urbanistTextTheme(),
            colorScheme: ColorScheme.fromSeed(seedColor: primary),
          ),

        ),
      ),
    );
  }
}


