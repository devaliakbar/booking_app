import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/utility/validator.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:bookingapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Address extends StatefulWidget {
  static const String myRoute = '/address';

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
                      buildTextField(
                          label: "Location*",
                          cFocusNode: _locationFocusNode,
                          cController: _locationController,
                          cValidator: onValidateLocation,
                          maxlength: 150,
                          enabled: false),
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

  Map<String, double> _locationData = new Map();
  _getCurrentLocation() async {
    Position locationData = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    _locationData['latitude'] = locationData.latitude;
    _locationData['longitude'] = locationData.longitude;
    _setLocationName();
  }

  _setLocationName() async {
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        _locationData['latitude'], _locationData['longitude']);

    _locationController.text = placemark[0].name +
        ", " +
        placemark[0].subAdministrativeArea +
        ", " +
        placemark[0].administrativeArea;
  }

  submit() {
    if (!_formKey.currentState.validate()) {
      print('Validate Triggered');
      return;
    }
  }
}
