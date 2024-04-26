import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Dummy.dart';
import 'package:untitled/adminlogin.dart';
import 'Login.dart';
import 'auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: 'AIzaSyB9m84p8Y_SY6isFvMaOFWOA2g4xKrb6Nc',
            appId: '1:773723122783:android:b26d30ed175962b3413fea',
            messagingSenderId: '773723122783',
            projectId: 'untitled-38d04')
    );
  }
  Get.put(auth());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: adminlogin(),
    );
  }
}

