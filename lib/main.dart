import 'package:flutter/material.dart';
import 'package:kings/SplashScreen.dart';
import 'package:kings/ThemeSampe.dart';
import 'package:kings/image%20picker.dart';
import 'package:kings/login.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:kings/preferences.dart';
import 'package:kings/sample%20im.dart';
import 'package:kings/theme.dart';

import 'firebase_options.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:
    DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,

      home:ImageFilePickerScreen(),
    );
  }}
