import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

Timer mytimer;
int minutes = 30;
int seconds = minutes * 60;

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey({int keyNumber, Color color}) {
    return (Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: (() {
          playSound(keyNumber);
        }),
      ),
    ));
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//        backgroundColor: Colors.black,
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(50),
//                width: 20,
//                height: 1,
//                color: Colors.orange,
                    child: Text(
                      minutes.toString(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(50),
//                width: 20,
//                height: 1,
//                color: Colors.orange,
                    child: Text(
                      seconds.toString(),
                      style: TextStyle(
                        color: Color(0xFF24D876),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: TextButton(
                  onPressed: () {
                    mytimer = Timer.periodic(Duration(seconds: 1), (timer) {
                      setState(() {
                        seconds--;
                      });
                    });
                    mytimer = Timer.periodic(Duration(minutes: 1), (timer) {
                      //code to run on every 5 seconds
                      setState(() {
                        minutes--;
                      });
                      if (minutes == 20) {
                        playSound(8);
                      } else if (minutes == 10) {
                        playSound(8);
                      } else if (minutes == 0) {
                        playSound(8);
                        timer.cancel();
                      }
                    });
                  },
                  child: Text('CountDown start'),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (minutes == 0) {
                  } else {
                    mytimer.cancel();
                  }
                },
                child: Text('Cancel Timer'))
          ],
        ),
      ),
    );
  }
}
