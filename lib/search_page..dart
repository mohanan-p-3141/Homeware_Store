import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchBarPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchBarPage({Key? key}) : super(key: key);

  Future<void> _search(BuildContext context) async {
    final query = _controller.text;
    const apiKey =
        '1b7a95fc5e90b0ef59c5b7a71bb736c1'; // Replace 'YOUR_API_KEY' with your OpenWeather API key

    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final cityName = data['name'];
      final temp = data['main']['temp'];
      final humidity = data['main']['humidity'];
      final windSpeed = data['wind']['speed']; // Extract wind speed data
      final minTemp =
          data['main']['temp_min']; // Extract minimum temperature data
      final maxTemp =
          data['main']['temp_max']; // Extract maximum temperature data

      final description = data['weather'][0]['description'];

      showDialog(
        context: context,
        builder: (context) => WeatherResultDialog(
          cityName: cityName,
          temperature: temp.toDouble(),
          humidity: humidity.toDouble(),
          windSpeed: windSpeed.toDouble(),
          minTemperature: minTemp.toDouble(),
          maxTemperature: maxTemp.toDouble(),
          description: description,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content:
              const Text('Failed to fetch weather data. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Weather'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/weather.jpeg', // Replace 'assets/background.jpg' with your image asset path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your location',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                    onSubmitted: (_) {
                      // Use the parent context here
                      _search(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherResultDialog extends StatelessWidget {
  final String cityName;
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double minTemperature;
  final double maxTemperature;
  final String description;

  const WeatherResultDialog({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.minTemperature,
    required this.maxTemperature,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Weather Information'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('City: $cityName'),
            Text('Temperature: ${temperature.toStringAsFixed(1)}°C'),
            Text('Humidity: ${humidity.toStringAsFixed(1)}%'),
            Text('Wind Speed: ${windSpeed.toStringAsFixed(1)} m/s'),
            Text('Min Temperature: ${minTemperature.toStringAsFixed(1)}°C'),
            Text('Max Temperature: ${maxTemperature.toStringAsFixed(1)}°C'),
            Text('Description: $description'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
