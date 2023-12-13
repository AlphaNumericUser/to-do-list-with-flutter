import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:async';

class TitleUp extends StatefulWidget {
  const TitleUp({super.key});

  @override
  State<TitleUp> createState() => _TitleUpState();
}

class _TitleUpState extends State<TitleUp> {

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var date = DateTime.now();

    var day = DateFormat('EEEE').format(date);
    var numberDay = DateFormat('d').format(date);
    var numberMonth = DateFormat('MM').format(date);
    var month = DateFormat('MMMM').format(date).substring(0, 3).toUpperCase();

    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 300,
      // color: Colors.red,
      width: double.infinity,
      child: Stack(
        children: [

          LeftData(day: day, numberDay: numberDay, numberMonth: numberMonth, month: month),

          CustomDivider(widthScreen: widthScreen),

          RightData(date: date)

        ]
      ),
    );
  }
}

    // print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
    // print(DateFormat('EEEE').format(date)); // prints Tuesday
    // print(DateFormat('EEEE, d MMM, yyyy').format(date)); // prints Tuesday, 10 Dec, 2019
    // print(DateFormat('h:mm a').format(date)); // prints 10:02 AM

// -----------------------------------------------------------------------------------------------------

class RightData extends StatelessWidget {
  const RightData({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormat('h:mm a').format(date), style: const TextStyle(fontSize: 26,)),
          const Text("AGS CITY", style: TextStyle(fontSize: 18,))
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------------------------------

class LeftData extends StatelessWidget {
  const LeftData({
    super.key,
    required this.day,
    required this.numberDay,
    required this.numberMonth,
    required this.month,
  });

  final String day;
  final String numberDay;
  final String numberMonth;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Hello, Alfredo", style: TextStyle(fontSize: 20,)),
        Text("It's $day", style: const TextStyle(fontSize: 20)),
        Text("$numberDay.$numberMonth", style: const TextStyle(fontSize: 76)),
        Text(month, style: const TextStyle(fontSize: 76, height: 0.5)),
        const Padding(
          padding: EdgeInsets.only(top: 32),
          child: Text("Your today's Tasks", style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------------------------------

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.widthScreen,
  });

  final double widthScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: widthScreen/3.2,
      top: 70,
      child: Container(
        height: 150,
        width: 1.0, // Ancho del divisor vertical
        color: Colors.black, // Color del divisor
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}