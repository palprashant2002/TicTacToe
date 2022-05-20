import 'dart:io';

import 'package:flutter/material.dart';

import 'demo.dart';

void main() {
  runApp(const tictac());
}

class tictac extends StatefulWidget {
  const tictac({Key? key}) : super(key: key);

  @override
  _tictacState createState() => _tictacState();
}

int _currentIndex = 1;
int pli=0;

class _tictacState extends State<tictac> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TICTACTOE",
      color: Colors.amber,
      home: Scaffold(
        body: IndexedStack(index: _currentIndex, 
        children: [board1(),Win(pl: pli)]
        ), 
      ),
    );
  }
}

class board1 extends StatefulWidget {
  const board1({Key? key}) : super(key: key);

  @override
  _board1State createState() => _board1State();
}

int count = 0;
String turn1 = "turn";
String turn2 = "";
List<String> check = [
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png",
  "assets/images/emp.png"
];
List pl1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
List pl2 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
int winst = 0;

class _board1State extends State<board1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      check = [
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png",
        "assets/images/emp.png"
      ];
      pl1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
      pl2 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
      count = 0;
      winst = 0;
      turn1 = "turn";
      turn2 = "";
      _currentIndex = 0;
      pli=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "TIC TAC TOE",
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Player 1 " + turn1,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
        Container(
          color: Colors.black,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 9 / 9),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    child: Image.asset(
                      check[index],
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      if (count % 2 == 0) {
                        check[index] = "assets/images/xsym.png";
                        pl1[index] = 1;
                        turn2 = turn1;
                        turn1 = "";
                        pli = 1;
                        if (wincheck(pl1)) {
                            winst = 1;
                          _currentIndex = 1;
                        }
                      } else {
                        check[index] = "assets/images/osym.png";
                        pl2[index] = 1;

                        turn1 = turn2;
                        turn2 = "";
                        pli = 2;
                        if (wincheck(pl2)) {
                          winst = 1;
                          _currentIndex = 1;
                        }
                      }
                      count++;
                      if ((count == 9) && (winst == 0)) {
                        _currentIndex = 1;
                      }
                    });
                  },
                );
              }),
          height: 363,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Player 2 " + turn2,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
        )
      ]),
    );
  }

  bool wincheck(List inp) {
    if ((inp[0] == inp[1]) && (inp[1] == inp[2]) && (inp[0] != 0))
      return true;
    else if ((inp[3] == inp[4]) && (inp[4] == inp[5]) && (inp[3] != 0))
      return true;
    else if ((inp[6] == inp[7]) && (inp[7] == inp[8]) && (inp[6] != 0))
      return true;
    else if ((inp[0] == inp[3]) && (inp[3] == inp[6]) && (inp[0] != 0))
      return true;
    else if ((inp[1] == inp[4]) && (inp[4] == inp[7]) && (inp[1] != 0))
      return true;
    else if ((inp[2] == inp[5]) && (inp[5] == inp[8]) && (inp[2] != 0))
      return true;
    else if ((inp[0] == inp[4]) && (inp[4] == inp[8]) && (inp[0] != 0))
      return true;
    else if ((inp[2] == inp[4]) && (inp[4] == inp[6]) && (inp[2] != 0))
      return true;
    else
      return false;
  }
}
class Win extends StatefulWidget {
  Win({Key? key, required this.pl}) : super(key: key);
  int pl;
  @override
  _WinState createState() => _WinState();
}

class _WinState extends State<Win> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 200,
          color: Colors.white,
          width: 300,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
            color: Colors.yellow,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                child: widget.pl == 3
                    ? Text(
                        "Match Draw",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Player " + widget.pl.toString() + " Wins",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
              ),
              Padding(

                padding: EdgeInsets.all(9),
                child: MaterialButton(
                  elevation: 5,
                  color: Colors.blue,
                  child: Container(
                    width: 160,
                    child: Row(children: [
                      Text(
                        "Play Again  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.restart_alt_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    ]),
                  ),
                  onPressed: () {
                    runApp(tictac());
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(9),
                child: MaterialButton(
                    elevation: 5,
                    color: Colors.blue,
                    child: Text(
                      "Exit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => exit(0)),
              ),
            ]),
          ),
        ),
    );
  }
}