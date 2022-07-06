import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:magix/home/app_foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase Initialization
  await Firebase.initializeApp();
  runApp(const AppFoundation());
}
