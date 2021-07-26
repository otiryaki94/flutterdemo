import 'package:flutter/material.dart';
import 'package:flutter_http_get_post/kullanici_ekle.dart';
import 'aracimi_taniyalim.dart';
import 'egitim.dart';
import 'liste_getir.dart';
import 'login.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: ListeGetir(),
      //home: KullaniciEkle(),
      home: Login(),
      //home: Menu(),
      //home: Egitim(),
      //home: AracimiTaniyalim(),
    );
  }
}