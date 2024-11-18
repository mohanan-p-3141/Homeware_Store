import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  final double latitude;
  final double longitude;

  const WeatherPage({Key? key, required this.latitude, required this.longitude, required weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add your implementation for WeatherPage UI here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: Center(
        child: Text('Weather forecast for $latitude, $longitude'),
      ),
    );
  }
}
