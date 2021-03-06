import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gelsenkirchen_avatar/data/lernort.dart';
import 'package:gelsenkirchen_avatar/screens/map_info_screen.dart';
import 'package:gelsenkirchen_avatar/screens/lernort_screen.dart';
/* Für Map-Style */
import 'package:flutter/services.dart' show rootBundle;

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapSampleState();
}

class MapSampleState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  Lernort lernort;

  String _mapStyle;

  static final CameraPosition _whsGelsenkrichen = CameraPosition(
    target: LatLng(51.5744, 7.0260),
    zoom: 12,
  );

  LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(47.0810, 2.3988), northeast: LatLng(54.3520, 18.6466));

  @override
  void initState() {
    super.initState();
    addMarkersForLernorte();
    /* Lädt das map_style.txt File als ein String ein */
    rootBundle.loadString('assets/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _whsGelsenkrichen,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              /* Map-Style setzen */
              controller.setMapStyle(_mapStyle);
            },
            onTap: (argument) => setState(() => lernort = null),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            padding: EdgeInsets.only(top: 120),
            cameraTargetBounds: CameraTargetBounds(bounds),
            minMaxZoomPreference: MinMaxZoomPreference(5, 20),
          ),
          /* LERNORT-VORSCHAU */
          InfoScreen(
            lernort: lernort,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          LernortScreen(l: lernort, k: "TODO")));
            },
          )
        ],
      ),
    );
  }

  void addMarkersForLernorte() {
    final markerImageFuture = BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 4.0),
        "assets/icons/Mapmarker_rot@2x.png");

    markerImageFuture.then((markerImage) {
      var lernorteFuture = Lernort.shared.gibObjekte();

      lernorteFuture.then((lernorte) {
        lernorte.forEach((lernort) {
          final marker = Marker(
            icon: markerImage,
            markerId: MarkerId(lernort.id.toString()),
            position: LatLng(lernort.nord, lernort.ost),
            onTap: () {
              setState(() {
                this.lernort = lernort;
              });
            },
          );
          setState(() {
            _markers.add(marker);
          });
        });
      });
    });
  }
}
