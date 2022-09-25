//main.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

double dgp_lati = 35.891914230322;
double dgp_lgti = 128.61119163387193;

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
      CameraPosition(target: LatLng(dgp_lati, dgp_lgti), zoom: 16);

  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: LatLng(dgp_lati, dgp_lgti)));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
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
    controller
        .animateCamera(CameraUpdate.newLatLng(LatLng(dgp_lati, dgp_lgti)));
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
