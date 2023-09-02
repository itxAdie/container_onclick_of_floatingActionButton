import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCalculatorVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator Demo"),
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              "Main Content",
              style: TextStyle(fontSize: 24),
            ),
          ),
          Positioned(
            right: 70,
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isCalculatorVisible
                  ? MediaQuery.of(context).size.width * .56
                  : 0,
              height: isCalculatorVisible
                  ? MediaQuery.of(context).size.height * 0.3
                  : 0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: isCalculatorVisible ? CalculatorWidget() : null,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isCalculatorVisible = !isCalculatorVisible;
          });
        },
        child: isCalculatorVisible ? Icon(Icons.cancel) : Icon(Icons.calculate),
      ),
    );
  }
}

class CalculatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.2,
      // height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.amber,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("7"),
              CalculatorButton("8"),
              CalculatorButton("9"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("4"),
              CalculatorButton("5"),
              CalculatorButton("6"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("1"),
              CalculatorButton("2"),
              CalculatorButton("3"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton("0"),
              CalculatorButton("_"),
              CalculatorButton("/"),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;

  CalculatorButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press here
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
