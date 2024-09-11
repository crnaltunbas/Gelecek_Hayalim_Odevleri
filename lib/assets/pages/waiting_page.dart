import 'package:flutter/material.dart';
import 'package:what_currency_app/assets/colors.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: WhatCurrencyAppColors.secondColor,
        body: Center(
            child: Text(
          "What Currency App",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF99DAFF),
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        )));
  }
}
