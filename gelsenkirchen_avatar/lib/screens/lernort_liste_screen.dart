import 'package:flutter/material.dart';
import 'package:gelsenkirchen_avatar/screens/kategorie_top_tab.dart';
import 'package:gelsenkirchen_avatar/screens/suchen_screen.dart';
import 'package:gelsenkirchen_avatar/widgets/nav-drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LernortListeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(top: 0),
            child: _customAppBar(context),
          ),
        ),
        /* Auflistung der einzelnen Kategorien */
        body: KategorieTopTab());
  }
}

Widget _customAppBar(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Text(
            'Lernorte',
          ),
        ),
        Container(
          child: IconButton(
              icon: Icon(FlutterIcons.search_mdi, color: Colors.white),
              onPressed: () {
                /* Nach Klick auf Lupe Lernortsuche */
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SuchenScreen()));
              }),
        ),
      ],
    ),
  );
}
