import 'package:flutter/material.dart';
import 'package:what_currency_app/assets/colors.dart';

void main() {
  runApp(const WhatCurrencyAppHomePage());
}

class WhatCurrencyAppHomePage extends StatefulWidget {
  const WhatCurrencyAppHomePage({super.key});
  @override
  WhatCurrencyAppHomePageState createState() =>
      WhatCurrencyAppHomePageState();

}
class WhatCurrencyAppHomePageState extends State<WhatCurrencyAppHomePage> {


  @override
  Widget build(BuildContext context) => throw UnimplementedError();
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            WhatCurrencyAppColors.secondColor, //Arka plan rengi eklendi
        appBar: AppBar(
            elevation: 20, // AppBar'a gölge eklemiş olduk.
            backgroundColor: WhatCurrencyAppColors
                .primaryColor, //AppBar'ın arka plan rengi eklendi
            flexibleSpace: const Padding(
              //flexibleSpace ile center widgetı sayesinde texti ortaladık padding sayesinde de aşağı indirdik.
              padding: EdgeInsets.only(top: 35.0),
              child: Center(
                child: Text(
                  "What Currency",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(
                        0xFF99DAFF), //Burada neden colors sınıfından ismi kabul ettmediğini anlayamadım.
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            )),
      ),
    );
  }
