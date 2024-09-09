import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageOne",
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: const Text("BURASI PAGEONE"),
          ),
        ),
      ),
    );
  }
}
