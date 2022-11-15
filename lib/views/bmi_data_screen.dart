import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // ignore: non_constant_identifier_names
  double CalculateBmi() {
    // ignore: non_constant_identifier_names
    double HeightInMeter = height / 100;

    final h = HeightInMeter * HeightInMeter;
    final bmi = weight / h;
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Center(child: Text("BMI CALCULATOR")),
      ),
      //
      //Widget Pemilihan Male / Female
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.male,
                        title: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.female,
                        title: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          //Widget Input Height
          Expanded(
            child: BmiCard(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("$height", style: numberTextStyle),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Slider(
                      value: height.toDouble(),
                      min: 80,
                      max: 200,
                      activeColor: Colors.white,
                      thumbColor: Colors.white,
                      onChanged: (value) {
                        height = value.toInt();
                        setState(() {});
                      },
                    )
                  ]),
            ),
          ),
          //
          //Widget Input Weight and Age
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight -= 1;
                                if (weight < 1) weight = 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            RawMaterialButton(
                              onPressed: () {
                                weight += 1;
                                if (weight > 200) weight = 200;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$age",
                          style: numberTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age -= 1;
                                if (age < 1) age = 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            RawMaterialButton(
                              onPressed: () {
                                age += 1;
                                if (age > 100) age = 100;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: const Color(0xff212747),
                              constraints: const BoxConstraints.tightFor(
                                width: 50,
                                height: 50,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          //Widget tombol Hitung BMI
          GestureDetector(
            onTap: () {
              //print(CalculateBmi());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    CalculateBmi();
                    return BmiResultScreen(
                      bmi: CalculateBmi(),
                    );
                  },
                ),
              );
            },
            child: Container(
              height: 80,
              color: const Color(0xffEC3C66),
              child: const Center(
                child: Text(
                  "CALCULATE BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(197, 114, 114, 114),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor!,
          ),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
