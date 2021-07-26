import 'package:flutter/material.dart';
import 'package:flutter_http_get_post/Models/Kullanici.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KullaniciEkle extends StatefulWidget {
  @override
  _KullaniciEkleState createState() => _KullaniciEkleState();
}

class _KullaniciEkleState extends State<KullaniciEkle> {

  Kullanici _kullanici = new Kullanici();
  final _formKey = GlobalKey<FormState>();

  Future<bool> kullaniciOlustur({Map body}) async {
    var url = Uri.parse('http://localhost:56793/Home/KullaniciKayit');
    return http.post(url, body: body).then((http.Response response) {

      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("beklenmediktir hata oluştu.");
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Kullanıcı Ekle"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ad'
                  ),
                  onSaved: (deger){
                    _kullanici.ad = deger;
                  },
                  validator: (deger){
                    if(deger.length<3){
                      return 'adınız en az 3 karakter olmalı';
                    }else{
                      return null;
                    }
                  }
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Soyad'
                  ),
                  onSaved: (deger){
                    _kullanici.soyad = deger;
                  },
                    validator: (deger){
                      if(deger.length<3){
                        return 'soyad en az 3 karakter olmalı';
                      }else{
                        return null;
                      }
                    }

                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ülke'
                  ),
                  onSaved: (deger){
                    _kullanici.ulke = deger;
                  },
                    validator: (deger){
                      if(deger.length<3){
                        return 'ülke en az 3 karakter olmalı';
                      }else{
                        return null;
                      }
                    }
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şehir'
                  ),
                  onSaved: (deger){
                    _kullanici.sehir = deger;
                  },
                    validator: (deger){
                      if(deger.length<3){
                        return 'şehir en az 3 karakter olmalı';
                      }else{
                        return null;
                      }
                    }
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefon'
                  ),
                  onSaved: (deger){
                    _kullanici.telefon = deger;
                  },
                    validator: (deger){
                      Pattern pattern =
                          r'(05|5)[0-9][0-9][1-9]([0-9]){6}';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(deger))
                        return 'telefon numarası geçersiz';
                      else
                        return null;
                    }
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () async {

                  bool _validate = _formKey.currentState.validate();
                  if(_validate){
                    _formKey.currentState.save();
                    await kullaniciOlustur(body: _kullanici.toMap());

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.green.shade300,
                          content: Text("kayit edildi.")
                      ),
                    );
                    _formKey.currentState.reset();
                  }
                },
                    child: Text("Kaydet"))
              ],
            ),
          ),
        ),
      )
    );
  }
}