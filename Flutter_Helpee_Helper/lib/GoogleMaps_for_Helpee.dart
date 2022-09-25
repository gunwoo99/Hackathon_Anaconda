import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'helpee_app.dart';
import 'database.dart';

var lati = double.parse(latiText);
var lgti = double.parse(lgtiText);
var db = crud('helper');
int sector =
    ((35.9 - lati) * 100).toInt() * 15 + ((lgti - 128.5) * 100 + 1).toInt();
int count = 2;
List<GeoPoint> geolist = [];

double dgp_lati = 35.891914230322;
double dgp_lgti = 128.61119163387193;
double dgp_lati2 = 35.891914230322 + 0.0000234;
double dgp_lgti2 = 128.61119163387193 - 0.000663;

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];

  /*
  //최초 시작 위치 지정
  static final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.6123504, 126.91451232),
    zoom: 13.5,
  );
  */

  //현재 위치를 불러오는 기능
  static final CameraPosition _ToMyposition =
      CameraPosition(target: LatLng(lati, lgti), zoom: 16);

  void addMarkers() async {
    final data = await db.matching(lgti, lati, sector);
    print(data.length);

    for (final datum in data) {
      double la = datum['geopoint'].latitude;
      double lo = datum['geopoint'].longitude;
      geolist.add(new GeoPoint(la, lo));
    }
  }

  @override
  void initState() {
    super.initState();
    addMarkers();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        onTap: () => print("헬퍼"),
        infoWindow: InfoWindow(title: "헬퍼: $lati, $lgti"),
        position: LatLng(lati, lgti))); //

    for (final geo in geolist) {
      _markers.add(Marker(
        markerId: MarkerId("${count++}"),
        onTap: () => print("헬퍼"),
        infoWindow: InfoWindow(title: "헬퍼: ${geo.latitude}, ${geo.longitude}"),
        position: LatLng(geo.latitude, geo.longitude),
      ));
    }
    // _markers.add(Marker(
    //   markerId: MarkerId("2"),
    //   onTap: () => print("헬피"),
    //   infoWindow: InfoWindow(title: "헬피: $dgp_lati2, $dgp_lgti2"),
    //   position: LatLng(dgp_lati2, dgp_lgti2),
    // )); //
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        zoomGesturesEnabled: true,
        mapType: MapType.normal,
        markers: Set.from(_markers),
        myLocationEnabled: true,
        rotateGesturesEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _ToMyposition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToMyPosition,
        child: Icon(
          Icons.my_location,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }

  Future<Position> getCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(CameraUpdate.newLatLng(LatLng(lati, lgti)));
    return position;
  }

  /*Future<void> _goToMyPosition() async
  {
    var gps = await getCurrentLocation();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(gps.latitude, gps.longitude))
    );
  }*/

  Future<void> _goToMyPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_ToMyposition));
  }
}
