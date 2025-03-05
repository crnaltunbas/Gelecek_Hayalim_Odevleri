import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageThree",
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: const Text("BURASI PAGETHREE"),
          ),
        ),
      ),
    );
  }
}
