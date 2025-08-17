import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 100.0);

const kMessageTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 60.0);

const kButtonTextStyle = TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB');

const kConditionTextStyle = TextStyle(fontSize: 100.0);

const kApikey = '026bde4c2d5079e1ef99744e5932acf4';

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, color: Colors.white),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
