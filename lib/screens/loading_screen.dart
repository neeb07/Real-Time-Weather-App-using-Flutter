import 'package:flutter/material.dart';
import 'package:weatherflutter/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData(); // Runs after screen is shown
  }

  getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    // var weatherData = await weatherModel.getLocationWeather();
    // Location location = Location();
    // await location.getcurrentLocation(context);
    //
    // NetworkHelper networkHelper = NetworkHelper(
    //   urls:
    //       'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApikey&units=metric',
    // );
    // var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100.0),
      ),
    );
  }
}
