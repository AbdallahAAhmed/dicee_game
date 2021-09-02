import 'dart:math';
import 'package:dicee/profile.dart';
import 'package:flutter/material.dart';

main() => runApp(Dicee());

class Dicee extends StatelessWidget {
  const Dicee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: DiceePage(),
      ),
    );
  }
}

class DiceePage extends StatefulWidget {
  const DiceePage({Key? key}) : super(key: key);

  @override
  _DiceePageState createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        changeDiceFace();
                        print(
                            'Left Dice Number = $leftDiceNumber AND Right Dice Number = $rightDiceNumber');
                      });
                    },
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text('B',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        changeDiceFace();
                        print(
                            'Right Dice Number = $rightDiceNumber AND Left Dice Number = $leftDiceNumber');
                      });
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Developer?',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Text(
                'Click Here',
                style: TextStyle(
                  // fontFamily: 'SourceSansPro',
                  fontSize: 21.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
