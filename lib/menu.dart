//icons https://www.flaticon.com/search?word=bus&license=selection&style=all&order_by=4&type=icon

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Models/MenuModel.dart';
import 'egitim.dart';

class Menu extends StatefulWidget {
  _MenuStatefulWidgetState  createState() => _MenuStatefulWidgetState ();
}

class _MenuStatefulWidgetState  extends State {
  List<MenuModel> menuList;

  _MenuStatefulWidgetState() {
    menuList = new List<MenuModel>();
    menuList.add(new MenuModel(1, "Bayi&Servis", "icons/tools.png"));
    menuList.add(new MenuModel(2, "Araç Bilgilerim", "icons/file.png"));
    menuList.add(new MenuModel(3, "Aracımı Kaydet", "icons/map.png"));
    menuList.add(new MenuModel(4, "Ürünler", "icons/bus.png"));
    menuList.add(new MenuModel(1, "Bayi&Servis", "icons/tools.png"));
    menuList.add(new MenuModel(2, "Araç Bilgilerim", "icons/file.png"));
    menuList.add(new MenuModel(3, "Aracımı Kaydet", "icons/map.png"));
    menuList.add(new MenuModel(4, "Ürünler", "icons/bus.png"));
    menuList.add(new MenuModel(1, "Bayi&Servis", "icons/tools.png"));
    menuList.add(new MenuModel(2, "Araç Bilgilerim", "icons/file.png"));
    menuList.add(new MenuModel(3, "Aracımı Kaydet", "icons/map.png"));
    menuList.add(new MenuModel(4, "Ürünler", "icons/bus.png"));
  }


  void _showCourse(context, course){
    Navigator.push(context, MaterialPageRoute(builder: (_){
      //return CourseScreen(course);
      return Egitim();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var menu = menuList[index];
        return GestureDetector(
          onTap: (){
            _showCourse(context, menu);
          },
          child: GridTile(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Image(
                  width: 50,
                  height: 50,
                  image: AssetImage(this.menuList[index].urlToImage),
                  //height: 50,
                ),
              ),
            ),
            footer: Text(
              this.menuList[index].title,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
          ),
        );
      },
      itemCount: this.menuList.length,
    );
  }
}