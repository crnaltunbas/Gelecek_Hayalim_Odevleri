import 'dart:convert';// json verilerini işler
import 'dart:io';//Web socket için gerekli

import 'package:flutter/material.dart';
import 'package:what_currency_app/assets/colors.dart';
import 'package:what_currency_app/assets/dimens.dart';
import 'package:what_currency_app/assets/fonts.dart';


class ForexPage extends StatefulWidget {
  const ForexPage({super.key});

  @override
  ForexPageState createState() => ForexPageState();
}

class ForexPageState extends State<ForexPage> {
 WebSocket? _socket;
  List<String> incomingData = [];

  @override
  void initState() {
    super.initState();
    connectForexPage(); // WebSocket'e bağlan
  }

  // WebSocket bağlantısını başlatma
  void connectForexPage() async {
    try {
      _socket = await WebSocket.connect('wss://ws-api.binance.com:443/ws-api/v3');
      _socket?.add(jsonEncode({ "id": 1,
      "method": "ping"  //ping ile bağlantı kontrolü
       }));
      _socket?.listen(
        (data) {
          var parsedData = jsonDecode(data);  // JSON verisini çözme
          setState(() {
            incomingData.add(parsedData.toString()); // Display the currency data
          });
        },
        onError: (error) {
          print('WebSocket Hatası: $error');
        },
        onDone: () {
          print('WebSocket bağlantısı kapandı.');
        },
      );
    } catch (e) {
      print('Bağlantı hatası: $e');
    }
  }

  @override
  void dispose() {
    _socket?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forex Rates',
            style: TextStyle(
                color: WhatCurrencyAppColors.thirdColor,
                fontFamily: Fonts.nunitoBold,
                fontSize: Dimens.body1),
          ),
          backgroundColor: WhatCurrencyAppColors.primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: incomingData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(incomingData[index]),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Sürekli veri akışı dinleniyor...'),
            )
          ],
        ),
      ),
    );
  }
}
