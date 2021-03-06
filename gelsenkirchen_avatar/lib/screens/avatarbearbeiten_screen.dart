import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gelsenkirchen_avatar/data/Avatar.dart';
import 'package:gelsenkirchen_avatar/widgets/ladescreen.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:gelsenkirchen_avatar/screens/profil_screen.dart';
import 'package:gelsenkirchen_avatar/data/benutzer.dart';

// ignore: camel_case_types
class Avatarbearbeiten extends StatefulWidget {
  @override
  _AvatarbearbeitenState createState() => _AvatarbearbeitenState();
}

class _AvatarbearbeitenState extends State<Avatarbearbeiten> {
  //Variable um Ladescreen zu steuern
  var _asyncResult;

/*auswaehlbareAvatare enthält nach dem initialisieren alle Dateipfade zu den Avataren die ausgewählt werden können
auswaehlbareAvatarePathIDs enthält die PfadID die nötig ist den gewaehlten Avatar in der Datenbank zu speichern*/
  List<String> auswaehlbareAvatare = new List();
  List<List<int>> auswaehlbareAvatarePathIDs = new List();

  List<int> ausgewahlterAvatarPathIDs = [0];
  bool antwortErhalten = false;

  @override
  void initState() {
    super.initState();

    ladeAsyncDaten().then((result) {
      setState(() {
        _asyncResult = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_asyncResult == null) {
      return Ladescreen();
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Avatar auswählen'),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text("Wähle deinen Avatar",
                    style: Theme.of(context).textTheme.headline3),
              ),
              /* SLIDER MIT AUSWÄHLBAREN AVATAREN */
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: CarouselSlider.builder(
                    itemCount: auswaehlbareAvatare.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(6.0),
                        child: Image.asset(auswaehlbareAvatare[index],
                            height: 300),
                      );
                    },
                    /* Slider-Eigenschaften */
                    options: CarouselOptions(
                        height: 100,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.3,
                        onPageChanged: (index, reason) {
                          setState(() {
                            ausgewahlterAvatarPathIDs =
                                auswaehlbareAvatarePathIDs[index];
                          });
                        })),
              ),
              Icon(
                FlutterIcons.arrow_upward_mdi,
                size: 40,
                color: Color(0xff0d4dbb),
              ),
              //Indikator
              /* SPEICHERN-BUTTON */
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ImageButton(
                  children: <Widget>[],
                  /* 302 x 91 sind die Originalmaße der Buttons */
                  width: 302 / 1.3,
                  height: 91 / 1.3,
                  paddingTop: 0,
                  /* PressedImage gibt ein Bild für den Button im gedrückten 
                          Zustand an. Bisher nicht implementiert, muss aber mit dem
                          Bild im normalen zustand angegeben werden. */
                  pressedImage: Image.asset(
                    "assets/buttons/Speichern_dunkelblau_groß.png",
                  ),
                  unpressedImage: Image.asset(
                      "assets/buttons/Speichern_dunkelblau_groß.png"),
                  onTap: () async {
                    Avatar.setAvatarFromPathIDs(
                            Benutzer.current.id, ausgewahlterAvatarPathIDs)
                        .then((bool result) {
                      setState(() {
                        print(result);
                        antwortErhalten = result;
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Profil(Benutzer.current.id)),
                            (Route<dynamic> route) => false);
                      });
                    });
                  },
                ),
              ),
            ],
          ));
    }
  }

/*Lädt beim initialisieren die Daten über Avatar.dart
Jedes Profil besitzt die Grundavatare, diese werden nicht explizit geladen also müssen sie vorher hinzugefügt werden 
Returned TRUE um die LadeScreenVariable zu steuern*/

  Future<bool> ladeAsyncDaten() async {
    auswaehlbareAvatare.add(Avatar.getDefaultImagePath(0));
    auswaehlbareAvatare.add(Avatar.getDefaultImagePath(1));
    auswaehlbareAvatare.add(Avatar.getDefaultImagePath(2));
    auswaehlbareAvatare.add(Avatar.getDefaultImagePath(3));
    auswaehlbareAvatarePathIDs.add([0]);
    auswaehlbareAvatarePathIDs.add([1]);
    auswaehlbareAvatarePathIDs.add([2]);
    auswaehlbareAvatarePathIDs.add([3]);

    auswaehlbareAvatare
        .addAll(await Avatar.getAuswaehlbareAvatarePath(Benutzer.current.id));
    auswaehlbareAvatarePathIDs.addAll(
        await Avatar.getAuswaehlbareAvatarePathIDs(Benutzer.current.id));

    return true;
  }
}
