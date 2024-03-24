import 'package:flutter/material.dart';
import 'models/weather_model.dart';
import 'service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // API key from OpenWeatherMap
  final _weatherService =
      WeatherService(apiKey: '5e8167db3cfec0c10a7a7a1fe0e5c1a6');
  Weather? _weather;
  // fetch weather data from the API
  _fetchWeather() async {
    String cityName = await _weatherService.getLocation().toString();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }
  //display the weather animations based on data

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(_weather?.cityName ?? "loading..."),
          //now for temperature
          Text('${_weather?.temperature.toString()}' 'C'),
        ]),
      ),
    );
  }
}
