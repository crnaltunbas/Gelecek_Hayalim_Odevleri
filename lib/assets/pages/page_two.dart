import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageTwo",
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: const Text("BURASI PAGETWO"),
          ),
        ),
      ),
    );
  }
}
