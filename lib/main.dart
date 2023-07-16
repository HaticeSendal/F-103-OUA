import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int first, second;
  late String res, text = "";
  late String opp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catch The Numbers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              customOutlinedButton("9"),
              customOutlinedButton("8"),
              customOutlinedButton("7"),
              customOutlinedButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlinedButton("6"),
              customOutlinedButton("5"),
              customOutlinedButton("4"),
              customOutlinedButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlinedButton("3"),
              customOutlinedButton("2"),
              customOutlinedButton("1"),
              customOutlinedButton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              customOutlinedButton("C"),
              customOutlinedButton("0"),
              customOutlinedButton("="),
              customOutlinedButton("/"),
            ],
          ),
        ],
      ),
    );
  }

  Widget customOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(25.0)),
        ),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: const TextStyle(fontSize: 30.0, color: Colors.blue),
        ),
      ),
    );
  }

  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }
    setState(() {
      text = res;
    });
  }
}
