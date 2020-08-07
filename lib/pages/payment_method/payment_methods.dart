import 'package:bookingapp/utility/app_theme.dart';
import 'package:bookingapp/widgets/build_button.dart';
import 'package:bookingapp/widgets/normal_text.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  static const String myRoute = '/payment_methods';
  @override
  State<StatefulWidget> createState() {
    return _PaymentsMethodState();
  }
}

class _PaymentsMethodState extends State<PaymentMethods> {
  bool _cardPayment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          _buildHeaderSections(context),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: <Widget>[
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.greyPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: _cardPayment
                                ? AppTheme.primaryGreenColor
                                : AppTheme.greyPrimaryColor),
                      ),
                      child: Row(
                        children: <Widget>[
                          _cardPayment
                              ? Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryGreenColor,
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: AppTheme.iconSizeS,
                                  ),
                                )
                              : Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.primaryGreenColor),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          createNormalText('Online Payments',
                              color: _cardPayment
                                  ? AppTheme.primaryGreenColor
                                  : Colors.black)
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _cardPayment = !_cardPayment;
                      });
                    },
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.greyPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: _cardPayment
                                ? AppTheme.greyPrimaryColor
                                : AppTheme.primaryGreenColor),
                      ),
                      child: Row(
                        children: <Widget>[
                          _cardPayment
                              ? Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppTheme.primaryGreenColor),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                )
                              : Container(
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryGreenColor,
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: AppTheme.iconSizeS,
                                  ),
                                ),
                          SizedBox(
                            width: 15,
                          ),
                          createNormalText('Cash On Delivery',
                              color: _cardPayment
                                  ? Colors.black
                                  : AppTheme.primaryGreenColor)
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _cardPayment = !_cardPayment;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          buildButton(
              label: 'Proceed',
              onPressed: () {},
              width: MediaQuery.of(context).size.width - 30),
          SizedBox(
            height: 15,
          ),
        ],
      )),
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
        createNormalText("Payment Method"),
      ],
    );
  }
}
