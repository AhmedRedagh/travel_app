// ignore_for_file: unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: unused_import
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travel_app/widgets/app_text.dart';

class NumberStepper extends StatefulWidget {
  const NumberStepper({super.key});

  @override
  State<NumberStepper> createState() => _NumberStepperState();
}

class _NumberStepperState extends State<NumberStepper> {
  int selectedIndex = 0;
  int stepperIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(50),
            child: Row(
              children: List.generate(
                5,
                (index) {
                  return InkWell(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: index == selectedIndex
                              ? Colors.black
                              : Colors.white),
                      child: Center(
                        child: AppText(
                          text: (index + 1).toString(),
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (selectedIndex > 0 && selectedIndex <= 4) {
                      setState(() {
                        selectedIndex--;
                      });
                    }
                  },
                  child: const Text(' Previous')),
              ElevatedButton(
                  onPressed: () {
                    if (selectedIndex > -1 && selectedIndex < 4) {
                      setState(() {
                        selectedIndex++;
                      });
                    }
                  },
                  child: const Text(' Next'))
            ],
          )
        ],
      ),
    );
  }
}
