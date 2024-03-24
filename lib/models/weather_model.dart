class Weather {
  final String cityName;
  final double temperature;
  final String weatherdescription;

  Weather(
      {required this.cityName,
      required this.temperature,
      required this.weatherdescription});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherdescription: json['weather'][0]['main'],
    );
  }
}
