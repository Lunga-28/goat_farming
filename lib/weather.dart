import 'package:flutter/material.dart';
import 'models/weather_model.dart';
import 'service/weather_service.dart';
import 'package:lottie/lottie.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(
      apiKey:
          'd07afd2cfc619b71bb18fb5b8a2dd16a'); // API key from OpenWeatherMap
  Weather? _weather;

  // Fetch weather data from the API
  _fetchWeather(String cityName) async {
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // Display the weather animations based on data
  String weatherAnimation(String? weatherDescription) {
    if (weatherDescription == null) return 'assets/images/sunny.json';
    switch (weatherDescription.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'fog':
      case 'smoke':
      case 'haze':
      case 'dust':
        return 'assets/images/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/images/rain.json';
      case 'thunderstorm':
        return 'assets/images/thunder.json';
      case 'clear':
        return 'assets/images/sunny.json';
      default:
        return 'assets/images/sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather("Your default city"); // Provide a default city here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
              // You can show a search dialog or navigate to a search page
            },
          ),
        ],
      ),
      body: _weather != null
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    _weather!.cityName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Lottie.asset(
                    weatherAnimation(_weather!.weatherdescription),
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _weather!.weatherdescription ?? "No data",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${_weather!.temperature.toString()}°C',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Humidity: ${_weather!.humidity.toString()}%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wind: ${_weather!.windSpeed.toString()} m/s',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
