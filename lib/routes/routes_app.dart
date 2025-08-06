import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:urgenthai/routes/routes_name_app.dart';
import 'package:urgenthai/screens/auth_screen/ui/login_screen.dart';
import 'package:urgenthai/screens/auth_screen/ui/otp_screen.dart';
import 'package:urgenthai/screens/auth_screen/ui/signup_screen.dart';
import 'package:urgenthai/screens/auth_screen/ui/sucessfully_register_screen.dart';
import 'package:urgenthai/screens/bottom_nav/mobile_bottom_nav.dart';
import 'package:urgenthai/screens/home_screen/home_screen.dart';
import 'package:urgenthai/screens/intro_screen/ui/intro_screens.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/ride_book.dart';
import 'package:urgenthai/screens/ride_module/ride_bottom_nav/ride_bottom_nav.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/rides_screen.dart';
import 'package:urgenthai/screens/ride_module/ride_screen/ui/ride_search.dart';
import '../../screens/splash_screen/ui/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: AppRouteConstants.splash,
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRouteConstants.splash,
      name: AppRouteConstants.splashName,
      pageBuilder: (context, state) => _fadePage(state, const SplashScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.intro,
      name: AppRouteConstants.introName,
      pageBuilder: (context, state) => _fadePage(state, const IntroScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.login,
      name: AppRouteConstants.loginName,
      pageBuilder: (context, state) => _fadePage(state, const LoginScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.signup,
      name: AppRouteConstants.signupName,
      pageBuilder: (context, state) => _fadePage(state, const SignupScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.otp,
      name: AppRouteConstants.otpName,
      pageBuilder: (context, state) => _fadePage(state, const OtpScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.successfullyRegister,
      name: AppRouteConstants.successfullyRegisterName,
      pageBuilder: (context, state) => _fadePage(state, const SuccessfullyRegisterScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.home,
      name: AppRouteConstants.homeName,
      pageBuilder: (context, state) => _slidePage(state, const HomeScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.bottomNav,
      name: AppRouteConstants.bottomNavName,
      pageBuilder: (context, state) => _slidePage(state, const BottomNav()),
    ),
    GoRoute(
      path: AppRouteConstants.rideBottomNav,
      name: AppRouteConstants.rideBottomNavName,
      pageBuilder: (context, state) => _fadePage(state, const RideBottomNav()),
    ),
    GoRoute(
      path: AppRouteConstants.ride,
      name: AppRouteConstants.rideName,
      pageBuilder: (context, state) => _fadePage(state, const RidesScreen()),
    ),
    GoRoute(
      path: AppRouteConstants.rideSearch,
      name: AppRouteConstants.rideSearchName,
      pageBuilder: (context, state) => _fadePage(state, const RideSearch()),
    ),
    GoRoute(
      path: AppRouteConstants.rideBook,
      name: AppRouteConstants.rideBookName,
      pageBuilder: (context, state) => _fadePage(state, const RideBookScreen()),
    ),
  ],
);

/// Common fade transition
CustomTransitionPage _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

/// Common slide-from-right transition
CustomTransitionPage _slidePage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideTween = Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).chain(CurveTween(curve: Curves.easeInOut));
      return SlideTransition(
        position: animation.drive(slideTween),
        child: child,
      );
    },
  );
}
