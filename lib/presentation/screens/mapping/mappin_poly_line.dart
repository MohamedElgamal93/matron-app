import 'dart:async';
import 'dart:typed_data';
import 'package:environment/util/constants/images.dart';
import 'package:environment/util/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import '../../../bussniess_logic/current_location/send_location_cubit.dart';
import '../../../data/model/location/loction_post.dart';
import '../../../util/constants/colors.dart';

class MappingScreenPoly extends StatefulWidget {
  const MappingScreenPoly({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

double _originLatitude = 6.5212402;
double _originLongitude = 3.3679965;
double _destLatitude = 6.5312402;
double _destLongitude = 3.379965;
double _destLatitude2 = 6.5412402;
double _destLongitude2 = 3.389965;
double _destLatitude3 = 6.5512402;
double _destLongitude3 = 3.399965;
double _destLatitude4 = 6.5612402;
double _destLongitude4 = 3.419965;
// Markers to show points on the map
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

class _MyAppState extends State<MappingScreenPoly> {
  // Google Maps controller
  // Completer<GoogleMapController> _controllerMap = Completer();
  GoogleMapController? _controller;

  // GoogleMapController? _controllerTracking;

  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 9.4746,
  );
  final Location _locationTracker = Location();
  StreamSubscription? _locationSubscription;
  late Timer timer;
  @override
  void initState() {
    timer = Timer( Duration(seconds: 5), () {
      getCurrentLocation();
    });

    /// add origin marker origin marker

    addMark(_originLatitude, _originLongitude, "origin");
    addMark(_destLatitude, _destLongitude, "destination");
    addMark(_destLatitude2, _destLongitude2, "destination2");
    addMark(_destLatitude3, _destLongitude3, "destination3");
    addMark(_destLatitude4, _destLongitude4, "destination4");

    _getPolyline();

    super.initState();
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  void getCurrentLocation() async {
    try {
      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }
       if (_controller != null) {
   var location = await _locationTracker.getLocation();
location.altitude;
location.latitude;
location.longitude;
    
      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        BlocProvider.of<LocationCubit>(context).sendLocation(
            LocationPost(
               // id: 1,
                lat: newLocalData.latitude!.toString(),
                lng: newLocalData.longitude!.toString(),
                online: true),
            context);
      });
        }
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: ConstColors.primaryColorEviron,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: const Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Text("Bus Number 4")))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(matronLogo), fit: BoxFit.fill),
              ),
              child: SizedBox(),
            ),
            ListTile(
              title: const Text('Complaints'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Data Usage'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  loginRoute,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: BlocConsumer<LocationCubit, LocationState>(
          listener: (previous, current) {
        if (current is LocationSuccess) {
          print("succeeeeeeeeeesssss");
          timer.isActive;
        }
      }, builder: (context, state) {
        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              // polylines: Set<Polyline>.of(polylines.values),
              markers: Set<Marker>.of(markers.values),
              // onMapCreated: (GoogleMapController controller) {
              //   _controllerMap.complete(controller);
              // },
                 onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, left: 17),
                child: Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: const BoxDecoration(
                            color: ConstColors.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Cairo Road"),
                              Text("Station Number"),
                            ]))))
          ],
        );
      }),
    ));
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor bitmapIcon) {
    MarkerId markerId = MarkerId(id);

    Marker marker =
        Marker(markerId: markerId, icon: bitmapIcon, position: position);

    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBPkaNi977BHu3tO2ALRt0flAlFhIV55Vg",
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  Future<void> addMark(double lat, double long, String status) async {
    _addMarker(
      LatLng(lat, long),
      status,
      await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(5, 5)), busStopImage),
    );
  }
}
