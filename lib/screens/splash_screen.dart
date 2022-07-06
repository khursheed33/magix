import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:magix/screens/authentication_screen.dart';
import 'package:magix/screens/dashboard_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, user) {
          if (user.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ),
            );
          }
          if (!user.hasData) {
            //TODO;:::
            return const Center(
              child: AuthenticationScreen(),
            );
          }
          return const DashboardScreenWithTabController();
        });
  }
}
