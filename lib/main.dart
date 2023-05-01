import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'DefaultTabBarUiPage.dart';

void main() {
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
      theme: ThemeData(brightness: Brightness.light,
      primarySwatch: Colors.teal),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          duration: 1000,
          splash: Text("Emergency App",style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.teal,
              fontFamily: "Serif"
          )),
          animationDuration: Duration(seconds: 2),
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: DefaultTabBarPage()),
    );
  }
}
