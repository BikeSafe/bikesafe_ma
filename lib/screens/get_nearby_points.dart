import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NearbyPoints extends StatefulWidget {
  @override
  _NearbyPointsState createState() => _NearbyPointsState();
}

class _NearbyPointsState extends State<NearbyPoints> {
  Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_currentPosition == null
                ? ""
                : "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            TextButton(onPressed: _showLocation, child: Text("Get location!")),
            TextButton(
                onPressed: _hideLocation, child: Text("Delete location!"))
          ],
        ),
      ),
    );
  }

  _showLocation() async {
    Position p = await _determinePosition();
    setState(() {
      _currentPosition = p;
    });
    //current arguments are hardcoded but will be retrieved from _currentPosition soon
    List<dynamic> l = await fetchPoints("80", "80", "100");
    print(l);
  }

  _hideLocation() {
    setState(() {
      _currentPosition = null;
    });
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  //Future<Map<String, dynamic>>
  Future<List<dynamic>> fetchPoints(lat, lng, radius) async {
    Map<String, dynamic> m = {"lat": lat, "lng": lng, "radius": radius};
    final response = await http
        .get(Uri.http('192.168.43.147:4000', 'api/interest_point', m));
    //URL should be the network facing ip of serving computer

    if (response.statusCode == 200) {
      print(response.body);
      print(response.body.runtimeType);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      print(response.body);
      return [];
    }
  }
}
