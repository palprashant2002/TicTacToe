import 'dart:ui';

import 'package:flutter/material.dart';

import 'fscr.dart';

class board extends StatefulWidget {
  const board({Key? key}) : super(key: key);

  @override
  _boardState createState() => _boardState();
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

class _boardState extends State<board> {
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

                        if (wincheck(pl1)) {
                          winst = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Win(
                                        pl: 1,
                                      )));
                        }
                      } else {
                        check[index] = "assets/images/osym.png";
                        pl2[index] = 1;

                        turn1 = turn2;
                        turn2 = "";
                        if (wincheck(pl2)) {
                          winst = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Win(pl: 2)));
                        }
                      }
                      count++;
                      if ((count == 9) && (winst == 0))
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Win(pl: 3)));
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

// class boardbuild extends StatefulWidget {
//   const boardbuild({Key? key}) : super(key: key);

//   @override
//   _boardbuildState createState() => _boardbuildState();
// }

// int count = 0;
// List<String> check = [
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png",
//   "assets/images/emp.png"
// ];
// List pl1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
// List pl2 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
// int winst = 0;

// class _boardbuildState extends State<boardbuild> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() {
//       check = [
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png",
//         "assets/images/emp.png"
//       ];
//       pl1 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
//       pl2 = [0, 0, 0, 0, 0, 0, 0, 0, 0];
//       count = 0;
//       winst = 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: 9,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, childAspectRatio: 9 / 9),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             child: Card(
//               child: Image.asset(
//                 check[index],
//                 fit: BoxFit.cover,
//               ),
//               color: Colors.grey,
//             ),
//             onTap: () {
//               setState(() {
//                 if (count % 2 == 0) {
//                   check[index] = "assets/images/xsym.png";
//                   pl1[index] = 1;
//                   if (wincheck(pl1)) {
//                     winst = 1;
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Win(
//                                   pl: 1,
//                                 )));
//                   }
//                 } else {
//                   check[index] = "assets/images/osym.png";
//                   pl2[index] = 1;
//                   if (wincheck(pl2)) {
//                     winst = 1;
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Win(pl: 2)));
//                   }
//                 }
//                 count++;
//                 if ((count == 9) && (winst == 0))
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => Win(pl: 3)));
//               });
//             },
//           );
//         });
//   }

//   bool wincheck(List inp) {
//     if ((inp[0] == inp[1]) && (inp[1] == inp[2]) && (inp[0] != 0))
//       return true;
//     else if ((inp[3] == inp[4]) && (inp[4] == inp[5]) && (inp[3] != 0))
//       return true;
//     else if ((inp[6] == inp[7]) && (inp[7] == inp[8]) && (inp[6] != 0))
//       return true;
//     else if ((inp[0] == inp[3]) && (inp[3] == inp[6]) && (inp[0] != 0))
//       return true;
//     else if ((inp[1] == inp[4]) && (inp[4] == inp[7]) && (inp[1] != 0))
//       return true;
//     else if ((inp[2] == inp[5]) && (inp[5] == inp[8]) && (inp[2] != 0))
//       return true;
//     else if ((inp[0] == inp[4]) && (inp[4] == inp[8]) && (inp[0] != 0))
//       return true;
//     else if ((inp[2] == inp[4]) && (inp[4] == inp[6]) && (inp[2] != 0))
//       return true;
//     else
//       return false;
//   }
// }
