import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: Text('Lucky 7'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int a = 2;
  int b = 3;
  void ChangeDice() {
    setState(() {
      var rng = Random();
      a = 1 + rng.nextInt(5);
      b = 1 + rng.nextInt(5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Are You Lucky???",
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () {
                    ChangeDice();
                  },
                  child: Image.asset('images/dice$a.png')),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  onPressed: () {
                    ChangeDice();
                  },
                  child: Image.asset('images/dice$b.png')),
            ))
          ]),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Total sum is " + (a + b).toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40,
        ),
        Column(children: [
          if (a + b == 7) ...[
            Text(
              "LUCKY 7!!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontStyle: FontStyle.italic),
            ),
          ] else ...[
            Text(
              "Unlucky You!!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
          ]
        ])
      ],
    );
  }
}
