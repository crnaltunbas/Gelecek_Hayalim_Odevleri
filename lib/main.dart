import 'package:flutter/material.dart';
import 'package:what_currency_app/assets/colors.dart';
import 'package:what_currency_app/assets/pages/page_one.dart';
import 'package:what_currency_app/assets/pages/page_two.dart';
import 'package:what_currency_app/assets/pages/page_three.dart';

void main() {
  runApp(const WhatCurrencyAppHomePage());
}

class WhatCurrencyApp extends StatelessWidget {
  const WhatCurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: //Arka plan rengi eklendi
            WhatCurrencyAppColors.secondColor,
      ),
    );
  }
}

class WhatCurrencyAppHomePage extends StatefulWidget {
  const WhatCurrencyAppHomePage({super.key});
  @override
  WhatCurrencyAppHomePageState createState() => WhatCurrencyAppHomePageState();
}

enum WhatCurrencyPages {
  homePage,
  pageOne,
  pageTwo,
  pageThree,
}

class WhatCurrencyAppHomePageState extends State<WhatCurrencyAppHomePage> {
  WhatCurrencyPages _selectedPage = WhatCurrencyPages.homePage;

  Widget _getPage(WhatCurrencyPages page) {
    switch (page) {
      case WhatCurrencyPages.homePage:
        return const WhatCurrencyApp(); // Bu ana sayfa olarak tanımlanacak
      case WhatCurrencyPages.pageOne:
        return const PageOne();
      case WhatCurrencyPages.pageTwo:
        return const PageTwo();
      case WhatCurrencyPages.pageThree:
        return const PageThree();
      default:
        return const WhatCurrencyApp(); // Varsayılan olarak  WhatCurrencyApp() olarak ayarlandı.Yani tıklanmadığında ana ekran açık kalacak.
    }
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
                  "What Currency App", // Burası dynamic yapılacak!!
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF99DAFF),
                    //Burada neden colors sınıfından ismi kabul ettmediğini anlayamadım.
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            )),
        body: _getPage(_selectedPage), //Seçtiğimiz sayfayı göstermemizi sağlar.
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 4.0,
          currentIndex: _selectedPage.index, //Enum indexini kullandık
          onTap: (int index) {
            setState(() {
              _selectedPage = WhatCurrencyPages.values[
                  index]; //Seçtiğimiz index ile enum indexi eşleştirmiş olduk
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF061A40),
                icon: (Icon(Icons.home, color: Color(0xFF99DAFF))),
                label: 'Home Page'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF061A40),
                icon: (Icon(Icons.abc, color: Color(0xFF99DAFF))),
                label: 'Page One'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF061A40),
                icon: (Icon(Icons.abc, color: Color(0xFF99DAFF))),
                label: 'Page Two'),
            BottomNavigationBarItem(
                backgroundColor: Color(0xFF061A40),
                icon: (Icon(Icons.abc, color: Color(0xFF99DAFF))),
                label: 'Page Three'),
          ],
        ),
      ),
    );
  }
}
