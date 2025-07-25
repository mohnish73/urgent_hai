 import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 import 'package:urgenthai/routes/routes_name_app.dart';
import 'package:urgenthai/screens/auth_screen/ui/login_screen.dart';
import 'package:urgenthai/screens/auth_screen/ui/otp_screen.dart';
import 'package:urgenthai/screens/intro_screen/ui/intro_screens.dart';

import '../../screens/splash_screen/ui/splash_screen.dart';


final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(

initialLocation:  AppRouteConstants.splash,
  navigatorKey: rootNavigatorKey,

  routes: [
    GoRoute(
      path: AppRouteConstants.splash,
      name: AppRouteConstants.splashName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRouteConstants.intro,
      name: AppRouteConstants.introName,
      builder: (context, state) => const IntroScreen(),
    ),

    GoRoute(
      path: AppRouteConstants.login,
      name: AppRouteConstants.loginName,
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRouteConstants.otp,
      name: AppRouteConstants.otpName,
      builder: (context, state) => const OtpScreen(),
    ),


  ],
);

