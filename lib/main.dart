import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrum_it/screens/DashboardScreen.dart';

import 'Utlis.dart';
import 'screens/DasboardScreenLandscape.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScrumIT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
   if (Utils.isPortrait(context)) return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
         child: DashboardScreen(),
      ),
    );
   else return Scaffold(
     backgroundColor: Colors.white,
     body: SafeArea(
       child: DasboardScreenLandscape(),
     ),
   );
  }
}
