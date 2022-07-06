import 'package:flutter/cupertino.dart';
import 'package:magix/home/app_routers.dart';
import 'package:magix/screens/authentication_screen.dart';
import 'package:magix/screens/dashboard_screen.dart';
import 'package:magix/screens/otp_verification_screen.dart';
import 'package:magix/screens/splash_screen.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.root:
        return CupertinoPageRoute(
          builder: (ctx) => const SplashScreen(),
          settings: settings,
          title: RoutePath.root,
        );
      case RoutePath.authentication:
        return CupertinoPageRoute(
          builder: (ctx) => const AuthenticationScreen(),
          settings: settings,
          title: RoutePath.authentication,
        );
      case RoutePath.dashboardTabControler:
        return CupertinoPageRoute(
          builder: (ctx) => const DashboardScreenWithTabController(),
          settings: settings,
          title: RoutePath.dashboardTabControler,
        );
      case RoutePath.otpVerification:
        return CupertinoPageRoute(
          builder: (ctx) => const OTPVerificationScreen(),
          settings: settings,
          title: RoutePath.otpVerification,
        );
    }
    return CupertinoPageRoute(
      builder: (ctx) => const AuthenticationScreen(),
      settings: settings,
      title: RoutePath.root,
    );
  }
}
