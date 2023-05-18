import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        //
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 1;

  void roll() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;

      if (rightDiceNumber == 6 || leftDiceNumber == 6) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text(
                  'Boyaa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text("Yahh You Got 6"),
              );
            });

        print("boyaa");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "RollndRoll",
          style: TextStyle(fontSize: 44, fontFamily: "BlackOpsOne"),
        ),
        SizedBox(
          height: 23,
        ),
        Container(
          width: 170,
          child: Image.asset("images/dice_image.png"),
        ),
        Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  child: Image.asset("images/dice$leftDiceNumber.png"),
                  onPressed: () {
                    roll();
                  }),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                child: Image.asset("images/dice$rightDiceNumber.png"),
                onPressed: () {
                  roll();
                },
              ),
            )),
          ],
        ),
        Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  roll();
                },
                child: Text(
                  "Roll",
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ))
          ],
        ),
      ],
    ));
  }
}
