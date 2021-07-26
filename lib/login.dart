import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_get_post/widgets/alert.dart';
import 'package:http/http.dart';
import 'Models/Kullanici.dart';
import 'package:http/http.dart' as http;

import 'menu.dart';


class Login extends StatefulWidget {
  @override
  _LoginStatefulWidgetState  createState() => _LoginStatefulWidgetState ();
}

class _LoginStatefulWidgetState  extends State<Login> {

  TextEditingController ePostaController;
  TextEditingController passwordController;
  Kullanici kullanici;
  Alerts a;

  _LoginStatefulWidgetState()
  {
    ePostaController = TextEditingController();
    passwordController = TextEditingController();
    kullanici = new Kullanici();
    a = new Alerts();
  }


  Future<String> login2(String ad, String soyad) async {
    final response = await http.post(
      Uri.parse('https://localhost:44388/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'ad': ad,
        'soyad': soyad
      }),
    );

    if(response.statusCode == 200){
      if(!response.body.isEmpty){
        //print("response: " + response.body);
        return "1";
      }
    }
    else{
      throw new Exception("beklenmediktir hata oluştu.");
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: Image(
                    height: 100,
                    image: AssetImage("images/otokar.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextField(
                    controller: ePostaController,
                    style: TextStyle(
                      color: Colors.white
                    ),
                      decoration: InputDecoration(
                          fillColor: Colors.black,
                          filled: true,
                          hintText: "E-Postanızı Giriniz",
                          hintStyle: new TextStyle(color: Colors.white),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      filled: true,
                      hintText: "******",
                      hintStyle: new TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                   child: ElevatedButton(
                      onPressed: () async {
                        if(ePostaController.text.isEmpty || passwordController.text.isEmpty){
                          a.showAlertDialog(context);
                        }
                        else{
                          kullanici.ad = ePostaController.text;
                          kullanici.soyad = passwordController.text;

                          String giris = await login2(kullanici.ad, kullanici.soyad);

                          if(giris == "1"){
                            Navigator.push(context, MaterialPageRoute(builder: (_){
                              //return CourseScreen(course);
                              return Menu();
                            }));
                          }
                          else{
                            a.errorAlertDialog(context);
                          }

                        }

                      },
                      child: Text("Giriş"),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(30),
                        primary: Colors.white, // <-- Button color
                        onPrimary: Colors.black, // <-- Splash color
                      ),
                    )
                ),
              ]
          ),
        )
    );
  }
}


