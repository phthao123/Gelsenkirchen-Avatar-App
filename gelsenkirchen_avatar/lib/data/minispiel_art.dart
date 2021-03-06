import 'package:gelsenkirchen_avatar/data/database_url.dart';
import 'package:gelsenkirchen_avatar/data/datenbankObjekt.dart';

// Stellt die Minispielart als Datenbankobjekt dar
class MinispielArt extends DatenbankObjekt<MinispielArt> {
  int id;
  String name;
  String beschreibung;

  static MinispielArt get shared => MinispielArt();

  MinispielArt({this.id, this.name, this.beschreibung})
      : super(
            DatabaseURL.getMinispielArt.value,
            DatabaseURL.insertIntoMinispielArt.value,
            DatabaseURL.removeFromMinispielArt.value,
            '');

  @override
  MinispielArt objektVonJasonArray(objekt) {
    return MinispielArt(
        id: int.parse(objekt["id"]),
        name: objekt["name"] as String,
        beschreibung: objekt["beschreibung"] as String);
  }

  @override
  Map<String, String> get map {
    return {
      "id": "$id",
      "name": "$name",
      "beschreibung": "$beschreibung",
    };
  }
}
