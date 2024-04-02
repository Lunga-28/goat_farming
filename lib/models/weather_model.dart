class Weather {
  final String cityName;
  final double temperature;
  final String weatherdescription;
  final String humidity;
  final String windSpeed;

  Weather(
      {required this.cityName,
      required this.temperature,
      required this.weatherdescription,
      required this.humidity,
      required this.windSpeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherdescription: json['weather'][0]['main'],
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
    );
  }
}
