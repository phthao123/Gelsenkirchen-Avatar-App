import 'package:flutter/material.dart';
import 'package:gelsenkirchen_avatar/data/lernort.dart';
import 'package:gelsenkirchen_avatar/data/lern_kategorie.dart';
import 'package:gelsenkirchen_avatar/quiz/start_quiz.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:gelsenkirchen_avatar/screens/lernen_screen.dart';

/* TODO: Kategorieicon einfügen */
class LernortScreen extends StatelessWidget {
  final Lernort l;
  final String k;

  LernortScreen({Key key, @required this.l, @required this.k})
      : super(key: key);
  List<LernKategorie> lernKato = List();

  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        //drawer: NavDrawer(),
        appBar: AppBar(
          /*NAME*/
          title: Text(l.name),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          /*TITELBILD*/

          Container(child: getWidgetTitelbild(l)),
          /*KATEGORIE*/
          /*TODO: - Hier muss noch der Kategoriename anstatt die KategorieId eingefügt werden */

          Row(children: [
            /* KATEGORIE */
            Text("Kategorie: ", style: Theme.of(context).textTheme.headline3),
            /* TODO: Kategoriename anzeigen (Lisa) */
            Text(""),
          ]),
          SizedBox(height: 10),

          Row(children: [
            /* ADRESSE */
            Text("Adresse: ", style: Theme.of(context).textTheme.headline3),
            /* TODO: Kategoriename anzeigen (Lisa) */
            Text(""),
          ]),
          SizedBox(height: 10),

          Row(children: [
            /* ADRESSE */
            Text("Öffnungszeiten: ", style: Theme.of(context).textTheme.headline3),
            /* TODO: Kategoriename anzeigen (Lisa) */
            Text(""),
          ]),
          SizedBox(height: 10),

          

          /*BESCHREIBUNG*/
          /* TODO: "Beschreibung" fett schreiben (Lisa) */
          Container(
            decoration: BoxDecoration(
                //color: Color(0xffe54b4b).withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.only(
                left: 10.0, top: 10.0, right: 10.0, bottom: 0.0),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              "Beschreibung:\n\n" + l.beschreibung,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            /* margin: EdgeInsets.only(
                      left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)) */
          ),
          SizedBox(height: 40),
          ImageButton(
            children: <Widget>[],
            /* 302 x 91 sind die Originalmaße der Buttons */
            width: 302 / 1.3,
            height: 91 / 1.3,
            paddingTop: 5,
            /* PressedImage gibt ein Bild für den Button im gedrückten 
                    Zustand an. Bisher nicht implementiert, muss aber mit dem
                    Bild im normalen zustand angegeben werden. */
            pressedImage: Image.asset(
              "assets/buttons/Lernen_blau_groß.png",
            ),
            unpressedImage: Image.asset("assets/buttons/Lernen_blau_groß.png"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Lernen(l: l)));
            },
          ),
          SizedBox(height: 20),
          ImageButton(
            children: <Widget>[],
            /* 302 x 91 sind die Originalmaße der Buttons */
            width: 302 / 1.3,
            height: 91 / 1.3,
            paddingTop: 5,
            /* PressedImage gibt ein Bild für den Button im gedrückten 
                    Zustand an. Bisher nicht implementiert, muss aber mit dem
                    Bild im normalen zustand angegeben werden. */
            pressedImage: Image.asset(
              "assets/buttons/Spielen_dunkelblau_groß.png",
            ),
            unpressedImage:
                Image.asset("assets/buttons/Spielen_dunkelblau_groß.png"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StartQuiz(l.id)));
            },
          ),
        ])));
  }
}

Widget getWidgetTitelbild(Lernort l) {
  if (l.titelbild.isEmpty) {
    return new Image.asset('assets/images/lernortPlaceholderTitelbild.jpg',
        fit: BoxFit.fill);
  } else {
    return new Image.network(l.titelbild, fit: BoxFit.fill);
  }
}
