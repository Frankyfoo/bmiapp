import 'package:flutter/material.dart';
import 'package:bmiapp/widgets/left_bar.dart';
import 'package:bmiapp/widgets/right_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      width: 130,
                      child: TextField(
                        controller: _heightController,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 42,
                          color: Colors.yellow,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "In Meter",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 130,
                      child: TextField(
                        controller: _weightController,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 42,
                          color: Colors.yellow,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "In Kilogram",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult >= 25) {
                    _textResult = "Over Weight";
                  } else if (_bmiResult <= 18.5) {
                    _textResult = "Under Weight";
                  } else {
                    _textResult = "Normal Weight";
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: const TextStyle(fontSize: 80, color: Colors.yellow),
              ),
            ),
            const SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 10),
            const LeftBar(barWidth: 50),
            const SizedBox(height: 10),
            const LeftBar(barWidth: 20),
            const SizedBox(height: 20),
            const RightBar(barWidth: 50),
            const SizedBox(height: 40),
            const RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
