import 'package:flutter/material.dart';
import 'package:gelsenkirchen_avatar/data/lern_kategorie.dart';
import 'package:gelsenkirchen_avatar/screens/lernort_liste_screen_kategorie.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gelsenkirchen_avatar/screens/lernort_screen.dart';
import 'package:gelsenkirchen_avatar/widgets/nav-drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:gelsenkirchen_avatar/data/lernort.dart';

class KategorieTopTab extends StatefulWidget {
  @override
  _KategorieTopTabState createState() => _KategorieTopTabState();
}

class _KategorieTopTabState extends State<KategorieTopTab> {
  int _listLength = 0;
  List<LernKategorie> lernKategorieList = List();
  String s = "ac_unit";

  @override
  void initState() {
    super.initState();
    var lernKategorieFuture = LernKategorie.shared.gibObjekte();
    lernKategorieFuture.then((lernkategorie) {
      setState(() {
        _listLength = lernkategorie.length;
        lernKategorieList = lernkategorie;
        print(lernKategorieList);
      });
    });
  }

  /*Diese Methode erstellt die ListViewItems*/
  Widget erstelleListViewitem(BuildContext context, int index) {
    Icon kategorienSymbol;
    Color symbolcolor = Color(0xff45d6a9);
    double symbolsize = 25;
    switch (lernKategorieList[index].id) {
      case 0:
        {
          kategorienSymbol =
              Icon(Icons.category, size: symbolsize, color: symbolcolor);
        }
        break;

      case 1:
        {
          kategorienSymbol = Icon(FlutterIcons.compass_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 2:
        {
          kategorienSymbol = Icon(FlutterIcons.seedling_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 3:
        {
          kategorienSymbol = Icon(FlutterIcons.futbol_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 4:
        {
          kategorienSymbol = Icon(FlutterIcons.palette_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 5:
        {
          kategorienSymbol = Icon(FlutterIcons.temperature_low_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 6:
        {
          kategorienSymbol = Icon(FlutterIcons.book_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 7:
        {
          kategorienSymbol = Icon(FlutterIcons.hand_holding_heart_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 8:
        {
          kategorienSymbol = Icon(FlutterIcons.music_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;

      case 9:
        {
          kategorienSymbol = Icon(FlutterIcons.laptop_code_faw5s,
              size: symbolsize, color: symbolcolor);
        }
        break;
    }

    return new Card(
        child: new Column(
      children: <Widget>[
        /*BILD*/
        /*new ListTile(
        leading: new Image.asset(
          "assets/" + _allCities[index].image,
          fit: BoxFit.cover,
          width: 100.0,
        ),*/
        new ListTile(
          title: Row(
            children: [
              kategorienSymbol,
              SizedBox(
                width: 25,
              ),
              new Text(
                /*NAME*/
                lernKategorieList[index].name != null
                    ? lernKategorieList[index].name
                    : 'empty',
                style:
                    new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          onTap: () {
            /*Hier kommt Aktion beim Klick auf Lernort hin*/
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LernortListeScreenKategorie(
                        lk: lernKategorieList[index])));
          },
        )
      ],
    ));
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _listLength,
      itemBuilder: erstelleListViewitem,
      padding: EdgeInsets.all(0.0),
    );
  }
}