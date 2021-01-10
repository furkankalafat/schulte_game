import 'package:flutter/material.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicGame.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicReverseGame.dart';

class GameSelector extends StatefulWidget {
  final String gameName;
  GameSelector({
    this.gameName,
  });
  @override
  _GameSelectorState createState() => _GameSelectorState();
}

class _GameSelectorState extends State<GameSelector> {
  bool hover;
  @override
  void initState() {
    hover = false;
    super.initState();
  }

  Widget build(BuildContext context) {
    return InkWell(
      onHover: (_) {
        setState(() {
          hover = _;
        });
      },
      onTap: () {
        if (GameSelector().gameName == 'Classic') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ClassicGame()));
        } else if (GameSelector().gameName == 'Classic Reverse') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ClassicReverseGame()));
        }
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: hover ? Colors.grey[700] : Colors.grey[800],
          borderRadius: BorderRadius.circular(15),
        ),
        width: 120,
        height: 60,
        child: Center(
          child: Text(
            widget.gameName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
