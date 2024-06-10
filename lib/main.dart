import 'package:flutter/material.dart';
import 'package:luckyroll/LuckyDraw.dart';

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
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 71, 83),
        fontFamily: 'ValorantFont'
        ),
      home: const LuckyDraw(),
    );
  }
}
