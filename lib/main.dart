import 'package:flutter/material.dart';
import 'lib/assets/colors.dart';
void main() {
  runApp(const WhatCurrencyApp());
}

class WhatCurrencyApp extends StatelessWidget {
  const WhatCurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        title: const Text(
            "What Currency",
        style: TextStyle(fontSize: 20,color: WhatCurrencyAppColors.thirdColor),),
      ),
    );
  }
}
