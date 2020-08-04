import 'package:bookingapp/main.dart';
import 'package:bookingapp/pages/address/widgets/location_pick_map.dart';
import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/validator.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:location/location.dart' as LocationTracker;

class Address extends StatefulWidget {
  static const String myRoute = '/address';

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderSections(
          context,
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      InkWell(
                        onTap: () => _showLocationAutoComplete(),
                        child: buildTextField(
                            label: "Location*",
                            cFocusNode: _locationFocusNode,
                            cController: _locationController,
                            cValidator: onValidateLocation,
                            maxlength: 150,
                            enabled: false),
                      ),
                      Positioned(
                        right: 10,
                        top: 11,
                        child: Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryGreenColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.my_location,
                                color: Colors.white,
                                size: AppTheme.iconSizeS,
                              ),
                              onPressed: () {
                                _getCurrentLocation();
                              }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  buildTextField(
                      label: "Full Name*",
                      cFocusNode: _fullNameFocusNode,
                      cController: _fullNameController,
                      cValidator: onValidateName),
                  SizedBox(
                    height: 15,
                  ),
                  buildTextField(
                      label: "Phone*",
                      cFocusNode: _phoneFocusNode,
                      cController: _phoneController,
                      inputType: TextInputType.phone,
                      maxlength: 15,
                      cValidator: onValidatePhone),
                  SizedBox(
                    height: 15,
                  ),
                  buildTextField(
                      label: "Address (Optional)",
                      cFocusNode: _addressFocusNode,
                      cController: _addressController,
                      maxlength: 150,
                      maxLine: 4,
                      cValidator: onValidateAddressAndLandmark),
                  SizedBox(
                    height: 15,
                  ),
                  buildTextField(
                      label: "Landmark (Optional)",
                      cFocusNode: _landmarkFocusNode,
                      cController: _landmarkController,
                      maxlength: 50,
                      cValidator: onValidateAddressAndLandmark),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        buildButton(
            label: 'Add Payment Method',
            onPressed: submit,
            width: MediaQuery.of(context).size.width - 30),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  Widget _buildHeaderSections(BuildContext context) {
    return Row(
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
        createNormalText("Delivery Address"),
      ],
    );
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();

  final _fullNameFocusNode = FocusNode();

  onValidateName(String value) {
    if (value.isEmpty) {
      return 'Please enter name';
    }

    if (!isValidAlphabetes(value)) {
      return 'Please enter valid name';
    }

    return null;
  }

  final _phoneController = TextEditingController();

  final _phoneFocusNode = FocusNode();

  onValidatePhone(String value) {
    if (value.isEmpty) {
      return 'Please enter phone';
    }

    if (!isNumeric(value)) {
      return 'Please enter valid number';
    }
    if (value.length < 7) {
      return 'Phone number length must be greater than 6';
    }

    return null;
  }

  final _addressController = TextEditingController();

  final _addressFocusNode = FocusNode();

  onValidateAddressAndLandmark(String value) {
    if (value.length == 1) {
      return 'Please enter valid text';
    }
    return null;
  }

  final _landmarkController = TextEditingController();

  final _landmarkFocusNode = FocusNode();

  final _locationController = TextEditingController();

  final _locationFocusNode = FocusNode();

  onValidateLocation(String value) {
    if (value.isEmpty) {
      return 'Please select location';
    }

    return null;
  }

  _showLocationAutoComplete() async {
    Prediction prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: MyApp.GOOGLE_API_KEY,
      onError: (PlacesAutocompleteResponse response) {
        print("Location Autocomplete Error : " + response.errorMessage);
      },
      mode: Mode.overlay,
      language: "en",
      components: [Component(Component.country, "in")],
    );

    if (prediction != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: MyApp.GOOGLE_API_KEY);
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(prediction.placeId);

      _setLocation(detail.result.geometry.location.lat,
          detail.result.geometry.location.lng);
    }
  }

  _getCurrentLocation() async {
    LocationTracker.Location location = new LocationTracker.Location();

    bool _serviceEnabled;
    LocationTracker.PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == LocationTracker.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != LocationTracker.PermissionStatus.granted) {
        return;
      }
    }

    LocationTracker.LocationData _locationDetail = await location.getLocation();
    _setLocation(_locationDetail.latitude, _locationDetail.longitude);
  }

  Map<String, dynamic> _locationData = new Map();

  _setLocation(double lat, double lon) async {
    var tempLocationData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickMap(lat, lon),
      ),
    );

    if (tempLocationData == null) {
      return;
    }

    _locationData = tempLocationData;

    _locationController.text = _locationData['name'];
  }

  submit() {
    if (!_formKey.currentState.validate()) {
      print('Validate Triggered');
      return;
    }
  }
}
