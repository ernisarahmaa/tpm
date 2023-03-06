import 'package:flutter/material.dart';
import 'package:tugas1_tpm/constanta/text.dart';
import 'constanta/colors.dart';
import 'package:math_expressions/math_expressions.dart';

class LandingPage extends StatelessWidget {
  static const routeName = "/LandingPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Stack(children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/1.6,
                        decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70), bottomLeft: Radius.circular(70)),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/hand.png",
                            scale: 2.3,
                          ),
                        )
                    )],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/2.666,
                      padding: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(children: [
                        Text(
                          "Get To Know Us!",
                          style: TextStyle(
                            fontSize: 30,
                            color: tPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child:
                          Text(
                              tNama1 + " " + "-" + " " + tNIM1,
                              style: TextStyle(
                                fontSize: 18,
                                color: tPrimaryColor,
                              )
                          ),
                        ),
                        Text(
                            tNama2 + " " + "-" + " " + tNIM2,
                            style: TextStyle(
                              fontSize: 18,
                              color: tPrimaryColor,
                            )
                        ),
                      ],),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(90, 680, 20, 0),
                    child: ElevatedButton(
                      child: Text(tCalculate),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return calculator();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: tPrimaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                          textStyle: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]
      ),
    );
  }
}

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => calculatorState();
}

class calculatorState extends State<calculator> {
  var userInput = '';
  var answer = '';

  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator"),
        backgroundColor: tPrimaryColor,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                      );
                    }
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.deepOrangeAccent,
                        textColor: Colors.white,
                      );
                    }

                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.orangeAccent
                            : tPrimaryColor,
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                      );
                    }
                  }), // GridView.builder
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

class MyButton extends StatelessWidget {

  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  //Constructor
  MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
