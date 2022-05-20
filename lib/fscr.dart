import 'package:flutter/material.dart';
import 'package:tictactoe/main.dart';
import 'dart:ui';
import 'dart:io';

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
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => tictac()));
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
