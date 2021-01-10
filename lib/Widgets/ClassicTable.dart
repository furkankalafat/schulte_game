import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yine_yeni_yeniden/Screens/HomeScreen.dart';
import 'package:yine_yeni_yeniden/Services/NumberServices.dart';

class ClassicTable extends StatefulWidget {
  final int index;
  final NumberServices numberServices;
  ClassicTable({
    @required this.index,
    @required this.numberServices,
  });
  @override
  _ClassicTableState createState() => _ClassicTableState();
}

class _ClassicTableState extends State<ClassicTable> {
  bool selected;
  Timer _everySecond;

  @override
  void initState() {
    //widget.numberServices = new NumberServices();
    widget.numberServices.createRandomNumbers();
    widget.numberServices.time = [DateTime.now()];
    widget.numberServices.selectedNumbers = ValueNotifier([0]);
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
        if (widget.numberServices.controlNumber(number: widget.index)) {
          setState(() {
            print(widget.index);
          });
        } else if (widget.numberServices.selectedNumbers.value.last == 25) {
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
          color: Colors.orange,
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
