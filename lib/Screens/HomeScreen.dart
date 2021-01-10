import 'package:flutter/material.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicGame.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicLightGame.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicLightReverseGame.dart';
import 'package:yine_yeni_yeniden/Screens/ClassicReverseGame.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hover;
  @override
  void initState() {
    hover = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
            child: Text(
          'SCHULTE GAME',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onHover: (_) {
                    setState(() {
                      hover = _;
                    });
                  },
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ClassicGame()));
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: hover ? Colors.orange[700] : Colors.orange[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Classic',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onHover: (_) {
                    setState(() {
                      hover = _;
                    });
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassicReverseGame()));
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: hover ? Colors.orange[700] : Colors.orange[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Classic Reverse',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onHover: (_) {
                    setState(() {
                      hover = _;
                    });
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassicLightGame()));
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: hover ? Colors.orange[700] : Colors.orange[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Classic Light',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onHover: (_) {
                    setState(() {
                      hover = _;
                    });
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClassicLightReverseGame()));
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: hover ? Colors.orange[700] : Colors.orange[800],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 200,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Classic Light Reverse',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
