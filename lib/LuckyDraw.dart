import 'package:flutter/material.dart';
import 'package:luckyroll/Spinner.dart';

class LuckyDraw extends StatefulWidget {
  const LuckyDraw({Key? key}) : super(key: key);

  @override
  _LuckyDrawState createState() => _LuckyDrawState();
}

class _LuckyDrawState extends State<LuckyDraw> {
  Map<String, double> prizes = {
    'BETTER LUCK\n NEXT TIME!': 0.15,
    'LANYARD': 0.1,
    'BETTER LUCK\n NEXT TIME!  ': 0.1,
    'KEYCHAIN': 0.2,
    'BETTER LUCK\n NEXT TIME!   ': 0.1,
    'TOTE BAG': 0.01,
    'BETTER LUCK\n NEXT TIME! ': 0.1,
    'SMALL MOUSE PAD': 0.08,
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
            offset: const Offset(-35, 60),
            child: Image.asset('assets/elements/Decoration.png'),
          ),
          Transform.translate(
            offset: const Offset(10, 60),
            child: Image.asset('assets/elements/PrizePool.png'),
          ),
          Center(
            child: Spinner(prizes: prizes),
          ),
        ],
      ),
    );
  }
}
