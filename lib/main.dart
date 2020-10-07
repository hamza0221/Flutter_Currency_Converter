import 'dart:convert';
import 'dart:io';
import 'package:Mintin_techTest/Screens/Login_screen.dart';
import 'package:Mintin_techTest/init.dart';
import 'package:Mintin_techTest/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  final Future _initFuture = Init.initialize();

  File jsonFile;
  Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  Map<String, dynamic> fileContent;
  Map<String, dynamic> jsonFileContent;
  bool isLoggedFb = false, isLoggedGoogle = false, isLoggedApp = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: MaterialApp(
          title: 'Found me',
          home: FutureBuilder(
            future: _initFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // if (Init.initialize())
                return LoginScreen();
              //  return LoginScreen();
              } else {
                return SplashScreen();
              }
            },
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

 


    //color theme
  }

  

  

  @override
  void dispose() {
    //keyInputController.dispose();
    // valueInputController.dispose();
    super.dispose();
  }

 
}
