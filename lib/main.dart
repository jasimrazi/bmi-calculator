import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

var result = '';
TextEditingController _heightController = TextEditingController();
TextEditingController _weightController = TextEditingController();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.height),
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Height',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.scale),
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Weight',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                    calculateBMI();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('calculate'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "BMI: $result",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
  void calculateBMI(){
    double h = double.parse(_heightController.text) / 100;
    double w = double.parse(_weightController.text);
    double r = (w / (h * h));
    setState(() {
      result = r.toStringAsFixed(1);
    });
  }
}
