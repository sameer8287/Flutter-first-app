// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class calc extends StatefulWidget {
  const calc({super.key});

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  Widget nmbtn(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btntxt);
      },
      style: ElevatedButton.styleFrom(
          fixedSize: Size(70, 70), shape: CircleBorder(), primary: btncolor),
      child: Text(
        btntxt,
        style: TextStyle(fontSize: 25, color: txtcolor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("CALCULATOR"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  nmbtn("C", Colors.grey, Colors.black),
                  nmbtn("+/-", Colors.grey, Colors.black),
                  nmbtn("%", Colors.grey, Colors.black),
                  nmbtn("/", Colors.orange, Colors.white)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  nmbtn("7", Colors.grey[850]!, Colors.white),
                  nmbtn("8", Colors.grey[850]!, Colors.white),
                  nmbtn("9", Colors.grey[850]!, Colors.white),
                  nmbtn("X", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  nmbtn("4", Colors.grey[850]!, Colors.white),
                  nmbtn("5", Colors.grey[850]!, Colors.white),
                  nmbtn("6", Colors.grey[850]!, Colors.white),
                  nmbtn("-", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  nmbtn("1", Colors.grey[850]!, Colors.white),
                  nmbtn("2", Colors.grey[850]!, Colors.white),
                  nmbtn("3", Colors.grey[850]!, Colors.white),
                  nmbtn("+", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      calculate("0");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), primary: Colors.grey[850]!),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 90, 15),
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                  nmbtn(".", Colors.grey[850]!, Colors.white),
                  nmbtn("=", Colors.orange, Colors.white)
                ],
              )
            ],
          )),
    );
  }

  int firstnumber = 0;
  int secondnumber = 0;
  String operation = "'";
  String text = "0";
  String result = "";
  void calculate(String btntxt) {
    if (btntxt == 'C') {
      firstnumber = 0;
      secondnumber = 0;
      result = "";
      text = "";
    } else if (btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'X' ||
        btntxt == '/') {
      firstnumber = int.parse(text);
      operation = btntxt;
      result = "";
    }
    // else if (operation == '%')
    // {
    //   result = (firstnumber / 100).toString();
    // }
    else if (btntxt == '=' || btntxt == '%') {
      secondnumber = int.parse(text);
      if (btntxt == '%') {
        result = (firstnumber / 100).toString();
      }
      if (operation == '+') {
        result = (firstnumber + secondnumber).toString();
      }
      if (operation == '-') {
        result = (firstnumber - secondnumber).toString();
      }
      if (operation == 'X') {
        result = (firstnumber * secondnumber).toString();
      }
      if (operation == '/') {
        result = (firstnumber / secondnumber).toString();
      }
    } else {
      result = int.parse(text + btntxt).toString();
    }

    setState(() {
      text = result;
    });
  }
}
