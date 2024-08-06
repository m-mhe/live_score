import 'package:flutter/material.dart';
import 'package:live_score/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Score',
      home: const HomeScreen(),
      theme: ThemeData(
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            headlineLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.yellow[800],)),
    );
  }
}
