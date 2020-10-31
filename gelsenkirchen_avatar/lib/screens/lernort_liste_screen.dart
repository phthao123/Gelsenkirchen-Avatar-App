import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gelsenkirchen_avatar/lernort.dart';
import 'package:gelsenkirchen_avatar/screens/lernort_screen.dart';
import 'package:gelsenkirchen_avatar/widgets/nav-drawer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class LernortListeScreen extends StatefulWidget {
  @override
  _LernortListeScreenState createState() => _LernortListeScreenState();
}

class _LernortListeScreenState extends State<LernortListeScreen> {
  @override
  void initState() {
    super.initState();
    /*Hier kann man alles mögliche aufrufen, was beim Laden des Screens
    geschehen soll*/

    testquery();
    //befuelleLernortList(testquery(daten));
  }

  List data = [];
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Lernorte'),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));

    /*Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Platzhalter: ListView mit Lernorten'),
        FlatButton(
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: () {
            //testquery();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LernortScreen()));
          },
          child: Text('Beispiel-Lernort'),
        ),
        FlatButton(
          textColor: Colors.white,
          color: Colors.grey,
          /*Aktion beim Drücken des Buttons muss noch ergänzt werden, wenn
          entsprechender Screen fertig ist. Codestück zum Springen in nächsten
          Screen beim Drücken des Button im nächsten Kommentar schon vorhanden.*/
          onPressed: () {
            //testquery();
            //Folgende Meldung dient nur zum Testen
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Testmeldung'),
                  content: Text(
                      "Testmethode testquery() wurde aufgerufen. Datensatz wurde aus der Datenbank gelesen und in der Konsole ausgegeben."),
                );
              },
            );
            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ScreenName()));*/
          },
          child: Text('Debug-Button: PHP-Skript testen'),
        )
      ])),*/
  }
}

getHomePageBody(BuildContext context) {
  return ListView.builder(
    itemCount: lernortList.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
  );
}

Widget _getItemUI(BuildContext context, int index) {
  return new Text(lernortList[index].name);
}

List<Lernort> lernortList = new List();

void fuelleListView(List datenquelle) {
  /*Iteriert über den Inhalt der List, die wir aus der DB bekommen, also über
  Map-Objekte, die die Datensätze enthalten*/
  var it = datenquelle.iterator;
  int resultID;
  String resultText;
  while (it.moveNext()) {
    Lernort datensatz = new Lernort();
    var valuesListe = it.current.values.toList();

    resultID = int.parse(valuesListe[0]);
    resultText = valuesListe[4];
    //datensatz.id = int.parse(valuesListe[0]);
    //datensatz.setName(resultText);

    datensatz.setId(resultID);
    datensatz.setName(resultText);
    lernortList.add(datensatz);
  }
}

/*Diese Methode erstellt die ListView mit Lernorten*/
/*ListView erstelleLernortListView(BuildContext context) {
  return ListView.builder(
    itemCount: lernortList.length,
    itemBuilder: _getItemUI,
    padding: EdgeInsets.all(0.0),
  );
}*/

/*Diese Methode wird für die Methode erstelleLernortListview() benötigt*/
/*Widget _getItemUI(BuildContext context, int index) {
  return new Text(lernortList[index].name);
}*/

/*Diese Methode holt die Daten aus der DB*/
testquery() async {
  var url = "http://zukunft.sportsocke522.de/getLernorte.php";
  var res = await http.get(url);

  //folgender Block wäre nötig um was in DB zu schreiben
  /* var data = {
    "email": "testemail",
    "benutzername": "testname",
    "passwort": "testpasswort",
  };
  var res = await http.post(url, body: data); */

  /*List, die Maps enthält, in denen jeweils ein Datensatz steckt.
  Zuordnung: Spaltenname -> Inhalt*/
  var lernortDatensaetze = new List();
  lernortDatensaetze = jsonDecode(res.body);
  print(lernortDatensaetze);

  //Fülle ListView
  fuelleListView(lernortDatensaetze);

  /* if (jsonDecode(res.body) == "Account existiert bereits") {
    Fluttertoast.showToast(
        msg: "Der Benutzer existiert bereits", toastLength: Toast.LENGTH_SHORT);
  } else {
    if (jsonDecode(res.body) == "true") {
      Fluttertoast.showToast(
          msg: "Benutzer erstellt", toastLength: Toast.LENGTH_SHORT);
    } else {
      Fluttertoast.showToast(msg: "error", toastLength: Toast.LENGTH_SHORT);
    }
  } */
}

//Diese Methode ist in Bearbeitung
void ladeLernorte() async {
  var url = "http://zukunft.sportsocke522.de/getLernorte.php";
  var res = await http.get(url);

  if (jsonDecode(res.body) == null) {
    print("Laden der Lernorte fehlgeschlagen.");
  } else {
    print("Laden der Lernorte erfolgreich.");
    /* setState(() {
      data = jsonDecode(res.body);
    }); */
  }
}
