import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../bussniess_logic/current_location/send_location_cubit.dart';
import '../../../data/model/location/loction_post.dart';

class MappingScreen extends StatefulWidget {
  const MappingScreen({Key? key}) : super(key: key);

  @override
  _MappingScreenState createState() => _MappingScreenState();
}

class _MappingScreenState extends State<MappingScreen> {
   StreamSubscription? _locationSubscription;
  final Location _locationTracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;

  static  CameraPosition initialLocation = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/images/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    setState(() {
      marker = Marker(
          markerId: const MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: const CircleId("car"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();
      print("locationlocation$location");

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
// print("latitude ${newLocalData.latitude!}");
// print("longitude ${newLocalData.longitude!}");



      //  if (_controller != null) {

  //send Lat & long Api
             BlocProvider.of<LocationCubit>(context).sendLocation(
                  LocationPost(
                            lat:"${newLocalData.latitude!}",
                             lng:"${newLocalData.longitude!}",
                           online:true),context);
         

          _controller!.animateCamera(CameraUpdate.newCameraPosition( CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude!, newLocalData.longitude!),
              tilt: 0,
              zoom: 18.00)));


            //    //send Lat & long Api
            //  BlocProvider.of<LocationCubit>(context).sendLocation(
            //       LocationPost(id:1,
            //                 lat:"${newLocalData.latitude!}",
            //                  lng:"${newLocalData.longitude!}",
            //                online:true),context);

          updateMarkerAndCircle(newLocalData, imageData);
      //  }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }
  @override
  void initState() {
       
 getCurrentLocation();
     super.initState();
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker!] : []),
        circles: Set.of((circle != null) ? [circle!] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },

      ),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.location_searching),
      //     onPressed: () {
      //       getCurrentLocation();
      //     }),
    );
  }
}