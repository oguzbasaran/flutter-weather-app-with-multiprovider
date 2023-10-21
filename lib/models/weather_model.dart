class Weather {
  final double temperature;
  final String description;
  final String icon;

  Weather(
      {required this.temperature,
      required this.description,
      required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}
