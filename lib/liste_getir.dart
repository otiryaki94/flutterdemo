import 'package:flutter/material.dart';
import 'package:flutter_http_get_post/Models/Kullanici.dart';
import 'kullanici_ekle.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Kullanici>> _kullaniciListesi;

class ListeGetir extends StatefulWidget {

  @override
  _ListeGetirState createState() => _ListeGetirState();
}

class _ListeGetirState extends State<ListeGetir> {

  @override
  void initState() {
    super.initState();
    _kullaniciListesi = _kullaniciGetir() as Future<List<Kullanici>>;
  }

   Future<List<Kullanici>> _kullaniciGetir() async {
     var url = Uri.parse('http://localhost:56793/Home/Kullanicilistesi');
     var response = await http.get(url);
     if(response.statusCode == 200){
       print("sa"  + json.decode(response.body));
       return (json.decode(response.body) as List).map((kullaniciMap) => Kullanici.fromJson(kullaniciMap)).toList();
     }else{
       throw Exception("Bağlantı kurulamadı");
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Listesi"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Kullanıcı Ekle',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> KullaniciEkle()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Yenile',
            onPressed: () {
              setState(() { _kullaniciListesi = _kullaniciGetir() as Future<List<Kullanici>>;});
            },
          )
        ],

      ),
      body: FutureBuilder(
        future: _kullaniciListesi,
        builder: (BuildContext context,AsyncSnapshot<List<Kullanici>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data[index].adsoyad),
                subtitle: Text(snapshot.data[index].telefon),
                leading: CircleAvatar(child: Text(snapshot.data[index].id.toString()),),
              );
            });
          }else{
            return Center(child: Text("Hata"));
          }
        },
      )
    );
  }
}


