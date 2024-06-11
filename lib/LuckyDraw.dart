import 'package:flutter/material.dart';
import 'package:luckyroll/Spinner.dart';

class LuckyDraw extends StatefulWidget {
  const LuckyDraw({Key? key}) : super(key: key);

  @override
  _LuckyDrawState createState() => _LuckyDrawState();
}

class _LuckyDrawState extends State<LuckyDraw> {
  Map<String, double> prizes = {
    'BETTER LUCK\n NEXT TIME!': 0.2,
    'LANYARD': 0.08,
    'BETTER LUCK\n NEXT TIME!  ': 0.15,
    'KEYCHAIN': 0.26,
    'BETTER LUCK\n NEXT TIME!   ': 0.1,
    'SMALL MOUSE PAD': 0.05,
    ' BETTER LUCK\n NEXT TIME!   ': 0.15,
    'LARGE MOUSE PAD': 0.01,
  };

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-600, 0),
            child: Image.asset('assets/elements/Solana Logo.png'),
          ),
          Transform.translate(
            offset: const Offset(850, -50),
            child: Image.asset(
              'assets/elements/Keychain.png',
              scale: 1.2,
            ),
          ),
          Transform.translate(
            offset: const Offset(900, 150),
            child: Image.asset(
              'assets/elements/Lanyard.png',
              scale: 0.1,
            ),
          ),
          Transform.translate(
            offset: const Offset(850, 180),
            child: Image.asset(
              'assets/elements/pad chuot to.png',
              scale: 1.3,
            ),
          ),
          Transform.translate(
            offset: const Offset(700, -150),
            child: Image.asset(
              'assets/elements/pad chuot nho.png',
              scale: 1.1,
            ),
          ),

          Center(
            child: Spinner(prizes: prizes),
          ),
        ],
      ),
    );
  }
}
