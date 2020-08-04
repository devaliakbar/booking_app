import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class LocationPickMap extends StatefulWidget {
  final double lat, lon;
  LocationPickMap(this.lat, this.lon);

  @override
  State<StatefulWidget> createState() {
    return _LocationPickMapState();
  }
}

class _LocationPickMapState extends State<LocationPickMap> {
  final Map<String, double> _locationData = new Map();

  @override
  void initState() {
    super.initState();

    _locationData['latitude'] = widget.lat;
    _locationData['longitude'] = widget.lon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: createNormalText('Map'),
      ),
    );
  }
}
