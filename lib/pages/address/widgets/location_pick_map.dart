import 'dart:async';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';

class LocationPickMap extends StatefulWidget {
  final double lat, lon;
  LocationPickMap(this.lat, this.lon);

  @override
  State<StatefulWidget> createState() {
    return _LocationPickMapState();
  }
}

class _LocationPickMapState extends State<LocationPickMap> {
  final Map<String, dynamic> _locationData = new Map();
  double zoom = 19.151926040649414;

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _currentLocation;

  @override
  void initState() {
    super.initState();

    _locationData['name'] = "";
    _locationData['latitude'] = widget.lat;
    _locationData['longitude'] = widget.lon;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/pin.png')
        .then((onValue) {
      pinLocationIcon = onValue;

      setState(() {
        _markers.add(Marker(
            markerId: MarkerId('<MARKER_ID>'),
            position:
                LatLng(_locationData['latitude'], _locationData['longitude']),
            icon: pinLocationIcon));
      });
    });

    _currentLocation = CameraPosition(
        bearing: 192.8334901395799,
        tilt: 30.0,
        target: LatLng(_locationData['latitude'], _locationData['longitude']),
        zoom: zoom);

    _getLocationName();
  }

  _getLocationName() async {
    final coordinates =
        new Coordinates(_locationData['latitude'], _locationData['longitude']);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _locationData['name'] = first.featureName;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 7),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    width: 60,
                    child: RaisedButton(
                        elevation: 0,
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
                        color: AppTheme.secondaryGreenColor,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: AppTheme.iconSize,
                          color: AppTheme.primaryGreenColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  createNormalText("Select Location"),
                ],
              ),
            ),
            Expanded(
              child: _buildMap(),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Divider(
                    color: AppTheme.primaryGreenColor,
                  ),
                  createNormalText('Your Location', size: AppTheme.fontSizeXS),
                  createNormalText(_locationData['name'],
                      size: AppTheme.fontSizeS, boldText: true, truncate: true),
                  Divider(
                    color: AppTheme.primaryGreenColor,
                  ),
                  buildButton(
                      label: 'Confirm Location',
                      onPressed: () {
                        Navigator.pop(context, _locationData);
                      },
                      width: MediaQuery.of(context).size.width - 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _markers,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      buildingsEnabled: true,
      compassEnabled: true,
      onCameraIdle: () {
        _setUpLocationChange(
            _locationData['latitude'], _locationData['longitude']);
      },
      onCameraMove: (CameraPosition newCameraPosition) {
        _locationData['latitude'] = newCameraPosition.target.latitude;
        _locationData['longitude'] = newCameraPosition.target.longitude;
        zoom = newCameraPosition.zoom;
      },
      onTap: (LatLng selectedLocation) => _setUpLocationChange(
          selectedLocation.latitude, selectedLocation.longitude),
      initialCameraPosition: _currentLocation,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  _setUpLocationChange(double lat, double lon) async {
    _locationData['latitude'] = lat;
    _locationData['longitude'] = lon;

    _currentLocation = CameraPosition(
        tilt: 30.0,
        bearing: 192.8334901395799,
        target: LatLng(_locationData['latitude'], _locationData['longitude']),
        zoom: zoom);

    _markers = {};

    _markers.add(Marker(
        markerId: MarkerId('<MARKER_ID>'),
        position: LatLng(_locationData['latitude'], _locationData['longitude']),
        icon: pinLocationIcon));

    _getLocationName();

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));
  }
}
