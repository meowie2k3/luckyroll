import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Spinner extends StatefulWidget {
  const Spinner({Key? key, required this.prizes}) : super(key: key);
  final Map<String, double> prizes;

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  // get item list from map
  List<FortuneItem> getItems() {
    List<FortuneItem> items = [];
    widget.prizes.forEach((key, value) {
      items.add(FortuneItem(
        child: Text(key),
        style: const FortuneItemStyle(
          color: Colors.transparent, // Set text color to #FF4753
          borderColor:
              Color.fromARGB(255, 255, 71, 83), // Set border color to #FF4753
          borderWidth: 5,
          textAlign: TextAlign.center,
          textStyle: TextStyle(
            fontFamily: 'ValorantFont',
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 71, 83),
          ),
        ),
      ));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    double spinnerSize = MediaQuery.of(context).size.width * 0.35;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              int result = resultChooser();
              selected.add(result);
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: spinnerSize,
                height: spinnerSize,
                color: Colors.transparent,
                child: Transform.rotate(
                  angle:
                      pi / 2, // Rotate the wheel counterclockwise by 90 degrees
                  child: FortuneWheel(
                    items: getItems(),
                    selected: selected.stream,
                    physics: CircularPanPhysics(
                      duration: const Duration(seconds: 2),
                      curve: Curves.decelerate,
                    ),
                    indicators: [
                      FortuneIndicator(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const VShape(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int resultChooser() {
    //take ratio from map
    List<double> ratio = [];
    widget.prizes.forEach((key, value) {
      ratio.add(value);
    });
    //check if ratio sum is 1
    double sum_ratio = 0;
    for (int i = 0; i < ratio.length; i++) {
      sum_ratio += ratio[i];
    }
    if (sum_ratio != 1) {
      print("Ratio sum is not 1");
      return -1;
    }
    //choose result
    double randomValue = Random().nextDouble();

    // Choose the result based on ratios
    double cumulativeRatio = 0;
    for (int i = 0; i < ratio.length; i++) {
      cumulativeRatio += ratio[i];
      if (randomValue <= cumulativeRatio) {
        return i;
      }
    }

    return -1; // Default value if something goes wrong
  }
}

class VShape extends Decoration {
  const VShape();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _VShapePainter();
  }
}

class _VShapePainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Path path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.center.dx, rect.bottom);
    path.lineTo(rect.right, rect.top);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = const Color.fromARGB(
              255, 255, 71, 83)); // Replace Colors.red with your desired color
  }
}
