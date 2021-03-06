import 'package:gelsenkirchen_avatar/data/database_url.dart';
import 'package:gelsenkirchen_avatar/data/datenbankObjekt.dart';

/// Lernort einer Stadt, mit zugehörigen Minispielen, 
/// Beschreibungen und weiteren Informationen
class Lernort extends DatenbankObjekt<Lernort> {
  int id;
  double nord;
  double ost;
  int kategorieID;
  String name;
  String adresse;
  String oeffnungszeiten;
  String website;
  String kosten;
  /* 0 = nicht barrierefrei und 1 = barrierefrei */
  int barrierefrei;
  String kurzbeschreibung;
  String beschreibung;
  String titelbild;
  int minispielArt;
  int belohnungenID;
  String weitereBilder;
  String videos;
  String sounds;

  /// Wird genutzt zur konsitenten Anzeige aller Lernorte
  /// und um die Abrufe aus der Datenbank zu minimieren.
  /// Beispiel: Lernort.shared.gibObjekte();
  static Lernort get shared => Lernort();

  Lernort(
      {this.id,
      this.nord,
      this.ost,
      this.kategorieID,
      this.name,
      this.adresse,
      this.oeffnungszeiten,
      this.website,
      this.kosten,
      this.barrierefrei,
      this.kurzbeschreibung,
      this.beschreibung,
      this.titelbild,
      this.minispielArt,
      this.belohnungenID,
      this.weitereBilder,
      this.videos,
      this.sounds})
      : super(
            DatabaseURL.getLernorte.value,
            DatabaseURL.insertIntoLernort.value,
            DatabaseURL.removeFromLernort.value,
            DatabaseURL.updateLernort.value);

  @override
  Lernort objektVonJasonArray(objekt) {
    return Lernort(
        id: int.parse(objekt["id"]),
        nord: double.parse(objekt["nord"]),
        ost: double.parse(objekt["ost"]),
        kategorieID: int.parse(objekt["kategorieID"]),
        name: objekt["name"] as String,
        adresse: objekt["adresse"] as String,
        oeffnungszeiten: objekt["oeffnungszeiten"] as String,
        website: objekt["webseite"] as String,
        kosten: objekt["kosten"] as String,
        barrierefrei: int.parse(objekt["barrierefrei"]),
        kurzbeschreibung: objekt["kurzbeschreibung"] as String,
        beschreibung: objekt["beschreibung"] as String,
        titelbild: objekt["titelbild"] as String,
        minispielArt: int.parse(objekt["minispielArtID"]),
        belohnungenID: int.parse(objekt["belohnungenID"]),
        weitereBilder: objekt["weitereBilder"] as String,
        videos: objekt["Videos"] as String,
        sounds: objekt["Sounds"] as String);
  }

  @override
  Map<String, String> get insertingIntoDatabaseRequestBody {
    var map = this.map;
    map.remove("id");
    return map;
  }

  @override
  Map<String, String> get map {
    return {
      "id": "$id",
      "nord": "$nord",
      "ost": "$ost",
      "kategorieID": "$kategorieID",
      "name": "$name",
      "adresse": "$adresse",
      "oeffnungszeiten": "$oeffnungszeiten",
      "website": "$website",
      "kosten": "$kosten",
      "barrierefrei": "$barrierefrei",
      "kurzbeschreibung": "$kurzbeschreibung",
      "beschreibung": "$beschreibung",
      "titelbild": "$belohnungenID",
      "minispielArtID": "$minispielArt",
      "belohnungenID": "$belohnungenID",
      "weitereBilder": "$weitereBilder"
    };
  }
}
