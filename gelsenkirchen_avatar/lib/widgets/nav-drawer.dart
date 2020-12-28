import 'package:flutter/material.dart';
import 'package:gelsenkirchen_avatar/screens/einstellungen_screen.dart';
import 'package:gelsenkirchen_avatar/screens/freundesliste_screen.dart';
import 'package:gelsenkirchen_avatar/screens/home_screen.dart';
import 'package:gelsenkirchen_avatar/screens/lernort_liste_screen.dart';
import 'package:gelsenkirchen_avatar/screens/profil_screen.dart';
import 'package:gelsenkirchen_avatar/screens/hilfe_screen.dart';
import 'package:gelsenkirchen_avatar/screens/impressum_screen.dart';
import 'package:gelsenkirchen_avatar/screens/registrierung_screen.dart';
import 'package:gelsenkirchen_avatar/screens/scoreboard_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue[200],
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/lernendestadt.png'))),
          ),

          /* HOME */
          ListTile(
              //leading: Icon(Icons.home),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                  maxWidth: 30,
                  maxHeight: 30,
                ),
                child: Image.asset("assets/icons/Home_dunkelblau_Icon.png"),
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreen()));
              }),

          /* PROFIL */
          ListTile(
              //leading: Icon(Icons.face),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                  maxWidth: 30,
                  maxHeight: 30,
                ),
                child: Image.asset("assets/icons/Profil_blau_Icon.png"),
              ),
              title: Text('Profil'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Profil()));
              }),

          /* TODO: Lernorteicon fehlt */
          /* LERNORTE */
          ListTile(
              //leading: Icon(Icons.account_balance),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                  maxWidth: 30,
                  maxHeight: 30,
                ),
                child: Image.asset("assets/icons/Lernort_rot_Icon.png"),
              ),
              title: Text('Lernorte'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            LernortListeScreen()));
              }),

          /* TODO: Freundeicon fehlt */
          /* FREUNDE */
          ListTile(
              leading: Icon(Icons.people),
              title: Text('Freunde'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Freundesliste()));
              }),

          /* TODO: Scoreboardicon fehlt */
          /* SCOREBOARD */
          ListTile(
              leading: Icon(Icons.score),
              title: Text('Scoreboard'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ScoreBoard(2)));
              }),

          /* TODO: Hilfe muss noch implenentiert werden (optional) */
          /* TODO: Hilfeicon fehlt (optional)*/
          /* HILFE */
          /* ListTile(
              leading: Icon(Icons.help),
              title: Text('Hilfe'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HilfeScreen()));
              }), */

          /* TODO: Einstellungen muss noch implenentiert werden (optional) */
          /* TODO: Einstellungenicon fehlt (optional) */
          /* EINSTELLUNGEN */
          /* ListTile(
              leading: Icon(Icons.settings),
              title: Text('Einstellungen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EinstellungenScreen()));
              }), */

          /* TODO: Impressumicon fehlt */
          /* IMPRESSUM */
          ListTile(
              leading: Icon(Icons.description),
              title: Text('Impressum'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ImpressumScreen()));
              }),

          /* TODO: Registrieren muss entfernt werden: */
          /* REGISTRIEREN */
          ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Registrierung'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Registrierung()));
              }),

          /* TODO: Logout-Funktion muss noch implementiert werden */
          /* TODO: Logouticon fehlt */
          /* LOGOUT */
          /* ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
            //Funktionalität zum Ausloggen fehlt noch
          ), */
        ],
      ),
    );
  }
}
