import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aracimi_taniyalim.dart';

class Egitim extends StatefulWidget {
  _EgitimStatefulWidgetState   createState() => _EgitimStatefulWidgetState ();
}


class _EgitimStatefulWidgetState  extends State {
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
                    height: 150,
                    image: AssetImage("images/otokar.png"),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 75,
                  padding: const EdgeInsets.only(top: 20, left:50, right: 50),
                  child: MaterialButton(
                    splashColor: Colors.orange[700],
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_){
                        //return CourseScreen(course);
                        return AracimiTaniyalim();
                      }));
                    },
                    color: Colors.orange[400],
                    child: Text(
                      "ARACIMI TANIYALIM",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 75,
                  padding: const EdgeInsets.only(top: 20, left:50, right: 50),
                  child: MaterialButton(
                    splashColor: Colors.orange[700],
                    onPressed: (){
                    },
                    color: Colors.orange[400],
                    child: Text(
                      "BİLMEM GEREKENLER",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 75,
                  padding: const EdgeInsets.only(top: 20, left:50, right: 50),
                  child: MaterialButton(
                    splashColor: Colors.orange[700],
                    onPressed: (){
                    },
                    color: Colors.orange[400],
                    child: Text(
                      "HESAPLI İPUÇLARI",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),

              ]
          ),
        )
    );
  }
}