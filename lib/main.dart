import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<GenerateNumber>(
      create: (_) => GenerateNumber(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red.shade900,
          appBar: AppBar(
            title: Text('Dicee'),
            backgroundColor: Colors.red.shade900,
          ),
          body: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GenerateNumber>(builder: (context, generateNumber, child) {
      return Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                child: Image.asset('images/dice${generateNumber.leftDice}.png'),
                onPressed: () {
                  generateNumber.randomizeDice();
                },
              ),
            ),
            Expanded(
              child: TextButton(
                child:
                    Image.asset('images/dice${generateNumber.rightDice}.png'),
                onPressed: () {
                  generateNumber.randomizeDice();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GenerateNumber extends ChangeNotifier {
  int leftDice = 1;
  int rightDice = 1;

  void randomizeDice() {
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
    notifyListeners();
  }
}
