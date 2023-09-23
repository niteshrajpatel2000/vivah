import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCurrent extends StatefulWidget {
  const MapCurrent({super.key});

  @override
  State<MapCurrent> createState() => _MapCurrentState();
}

class _MapCurrentState extends State<MapCurrent> {

  String _locationMessage = '';

  String? country;
  String? loc;
  String? post;
  String? sub;
  @override

  void initState() {
    setState(() {
      _requestLocationPermission();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body:ListView(
        children: [
          Text(country??""),
          Text(loc??""),
          Text(post??""),
          Text(sub??""),
          Text(country??""),
          Text(sub??""),
        ],
      )
      ,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.my_location),
        onPressed: () {
          _requestLocationPermission();

      },),
    );
  }



  Future<void> _requestLocationPermission() async {
    final permissionStatus = await Geolocator.requestPermission();
    if (permissionStatus == LocationPermission.denied) {
      setState(() {
        Fluttertoast.showToast(
          msg: "please give permission to the location",
          toastLength: Toast.LENGTH_SHORT,
          // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM,
          // Toast position
          timeInSecForIosWeb: 1,
          // Time duration for iOS/web
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    } else if (permissionStatus == LocationPermission.always ||
        permissionStatus == LocationPermission.whileInUse) {
      setState(() {
        _getLocation();
      });
    }
  }









  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );


      if (placemarks.isNotEmpty) {


        if (placemarks.first.locality != null) {

          country=placemarks.first.country;
          loc=placemarks.first.locality;
          post=placemarks.first.subLocality;
          sub=placemarks.first.postalCode;
          country=placemarks.first.street;

        }
      }
      LatLng _currentPosition ;
      setState(() {
        _locationMessage =
        'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
        Fluttertoast.showToast(
          msg: position.latitude.toString(),
          toastLength: Toast.LENGTH_SHORT,
          // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM,
          // Toast position
          timeInSecForIosWeb: 1,
          // Time duration for iOS/web
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        _currentPosition = LatLng(position.latitude, position.longitude);

      });
    } catch (e) {
      setState(() {
        _locationMessage = 'Error: ${e.toString()}';
        Fluttertoast.showToast(
          msg: _locationMessage,
          toastLength: Toast.LENGTH_SHORT,
          // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM,
          // Toast position
          timeInSecForIosWeb: 1,
          // Time duration for iOS/web
          backgroundColor: Colors.pink,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    }
  }



}
