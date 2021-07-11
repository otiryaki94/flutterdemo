// To parse this JSON data, do
//
//     final kullanici = kullaniciFromJson(jsonString);

import 'dart:convert';

List<Kullanici> kullaniciFromJson(String str) => List<Kullanici>.from(json.decode(str).map((x) => Kullanici.fromJson(x)));

String kullaniciToJson(List<Kullanici> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kullanici {
  Kullanici({
    this.id,
    this.ad,
    this.soyad,
    this.ulke,
    this.sehir,
    this.telefon,
    this.silindiMi,
    this.adsoyad,
  });

  int id;
  String ad;
  String soyad;
  String ulke;
  String sehir;
  String telefon;
  String adsoyad;
  bool silindiMi;

  factory Kullanici.fromJson(Map<String, dynamic> json) => Kullanici(
    id: json["Id"],
    ad: json["Ad"],
    soyad: json["Soyad"],
    ulke: json["Ulke"],
    sehir: json["Sehir"],
    telefon: json["Telefon"],
    silindiMi: json["SilindiMi"],
    adsoyad: json["Ad"] +" "+ json["Soyad"]
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Ad": ad,
    "Soyad": soyad,
    "Ulke": ulke,
    "Sehir": sehir,
    "Telefon": telefon,
    "SilindiMi": silindiMi
  };

  Map toMap() {
    var map = new Map();

    map["Ad"] = ad;
    map["Soyad"] = soyad;
    map["Ulke"] = ulke;
    map["Sehir"] = sehir;
    map["Telefon"] = telefon;

    return map;
  }
}
