import 'package:flutter/material.dart';
import 'package:live_score/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Score',
      home: const HomeScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
              titleLarge:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
              headlineLarge: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.black54,
            backgroundColor: Colors.yellow[800],
          )),
    );
  }
}
