import 'package:flutter/material.dart';
import 'package:what_currency_app/assets/colors.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
        backgroundColor:
        WhatCurrencyAppColors.secondColor,
    )
    ); //Arka plan rengi eklendi
  }
}
