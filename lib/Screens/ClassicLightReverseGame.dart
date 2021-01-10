import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yine_yeni_yeniden/Services/NumberServices.dart';
import 'package:yine_yeni_yeniden/Widgets/ClassicLightReverseTable.dart';

class ClassicLightReverseGame extends StatefulWidget {
  final int number;
  ClassicLightReverseGame({
    this.number,
  });
  @override
  _ClassicLightReverseGameState createState() =>
      _ClassicLightReverseGameState();
}

class _ClassicLightReverseGameState extends State<ClassicLightReverseGame> {
  bool selected;
  DateTime _instant;
  Timer _everySecond;

  NumberServices numberServices;

  int temp = 25;

  @override
  void initState() {
    numberServices = new NumberServices();
    numberServices.createRandomNumbers();
    numberServices.time = [DateTime.now()];
    _instant = DateTime.now();
    numberServices.selectedNumbers = ValueNotifier([0]);
    selected = false;

    _everySecond = Timer.periodic(Duration(milliseconds: 10), (Timer t) {
      setState(() {
        _instant = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  dispose() {
    _everySecond.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        title: Center(
          child: Text(
            'CLASSIC LIGHT REVERSE GAME',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Center(
              child: Text(
            "Sure: ${_instant.difference(numberServices.time[0])}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ))
        ],
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(80, 100, 80, 0),
        child: GridView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return ClassicLightReverseTable(
              index: numberServices.randomNumbers[index],
              numberServices: numberServices,
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.5,
            crossAxisCount: 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
        ),
      ),
    );
  }
}
