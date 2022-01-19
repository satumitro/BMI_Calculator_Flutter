// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmihomepage(),
    );
  }
}

// ignore: camel_case_types
class bmihomepage extends StatefulWidget {
  const bmihomepage({Key? key}) : super(key: key);

  @override
  _bmihomepageState createState() => _bmihomepageState();
}

// ignore: camel_case_types
class _bmihomepageState extends State<bmihomepage> {
  final TextEditingController bmiheight = TextEditingController();
  final TextEditingController bmiweight = TextEditingController();
  var bmiresult, status;

  void calculateBMI() {
    setState(() {
      double height = double.parse(bmiheight.text) / 39.37;
      double weight = double.parse(bmiweight.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;

      bmiresult = result;
      if (bmiresult < 18.5) {
        status = "Underweight";
      } else if (bmiresult < 25) {
        status = "Normal";
      } else {
        status = "Overweight";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: <Widget>[
                // BMI RESULT AREA
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: [
                            const Text(
                              " BMI ",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              bmiresult == null
                                  ? "--"
                                  : "${bmiresult.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // BMI STATUS AREA
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Column(
                          children: [
                            const Text(
                              "STATUS ",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              bmiresult == null ? "--" : "$status",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "Enter Your Height Here",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        // textfield area for height
                        TextField(
                          controller: bmiheight,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Height in Inch',
                            hintText: "Enter Your Height in Inch",
                            prefixIcon: Icon(Icons.trending_up),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Text(
                            "Enter Your Weight Here",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        // textfield area for wight
                        TextField(
                          controller: bmiweight,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight in Kg',
                            hintText: "Enter Your Weight in Kilograms",
                            prefixIcon: Icon(Icons.line_weight),
                          ),
                        ),
                      ],
                    )),

                SizedBox(height: 18),
                //  flatbutton starts here
                Container(
                  height: 50,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  // ignore: deprecated_member_use
                  child: FlatButton(
                      onPressed: () {
                        calculateBMI();
                      },
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
