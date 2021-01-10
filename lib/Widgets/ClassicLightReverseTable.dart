import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yine_yeni_yeniden/Screens/HomeScreen.dart';
import 'package:yine_yeni_yeniden/Services/NumberServices.dart';

class ClassicLightReverseTable extends StatefulWidget {
  final int index;
  final NumberServices numberServices;
  ClassicLightReverseTable({
    @required this.index,
    @required this.numberServices,
  });
  @override
  _ClassicLightReverseTableState createState() =>
      _ClassicLightReverseTableState();
}

class _ClassicLightReverseTableState extends State<ClassicLightReverseTable> {
  bool selected;
  Timer _everySecond;

  @override
  void initState() {
    //widget.numberServices = new NumberServices();
    widget.numberServices.createRandomNumbers();
    widget.numberServices.time = [DateTime.now()];
    widget.numberServices.selectedNumbers = ValueNotifier([26]);
    selected = false;

    _everySecond = Timer.periodic(Duration(milliseconds: 10), (Timer t) {
      setState(() {});
    });
    super.initState();
  }

  @override
  dispose() {
    _everySecond.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.numberServices.controlNumberReverse(number: widget.index)) {
          setState(() {
            selected = true;
            print(widget.index);
          });
        } else if (widget.numberServices.selectedNumbers.value.last == 1) {
          _everySecond.cancel();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                  'Toplam Sure: ${DateTime.now().difference(widget.numberServices.time[0])}'),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('Menüye Dön'),
                ),
              ],
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? Colors.green : Colors.orange,
        ),
        child: Center(
          child: Text(
            "${widget.index}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
