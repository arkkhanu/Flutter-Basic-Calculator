import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int no1;
  int no2;
  String displaytext = "";
  String res = "";
  String operatorPerform = "";
  void btnClicked(String _btnval) {
    if (_btnval == "C" || _btnval == "c") {
      displaytext = "";
      no1 = 0;
      no2 = 0;
      res = "";
    } else if (_btnval == "+" ||
        _btnval == "-" ||
        _btnval == "x" ||
        _btnval == "/") {
      no1 = int.parse(displaytext);
      res = "";
      operatorPerform = _btnval;
    } else if (_btnval == "=") {
      no2 = int.parse(displaytext);
      if (operatorPerform == "+") {
        res = (no1 + no2).toString();
      }
      if (operatorPerform == "-") {
        res = (no1 - no2).toString();
      }
      if (operatorPerform == "x") {
        res = (no1 * no2).toString();
      }
      if (operatorPerform == "/") {
        res = (no1 ~/ no2).toString();
      }
    } else {
      res = int.parse(displaytext + _btnval).toString();
    }
    setState(() {
      displaytext = res;
    });
  }

  Widget customButton(String _btnval) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(20.0),
      onPressed: () => btnClicked(_btnval),
      child: Text(
        "$_btnval",
        style: TextStyle(fontSize: 20.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$displaytext",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
              ),
            )),
            Row(
              children: <Widget>[
                customButton("7"),
                customButton("8"),
                customButton("9"),
                customButton("+"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("4"),
                customButton("5"),
                customButton("6"),
                customButton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("1"),
                customButton("2"),
                customButton("3"),
                customButton("x"),
              ],
            ),
            Row(
              children: <Widget>[
                customButton("C"),
                customButton("0"),
                customButton("="),
                customButton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
