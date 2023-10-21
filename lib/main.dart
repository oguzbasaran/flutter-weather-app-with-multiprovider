import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/location_provider.dart';
import 'providers/weather_provider.dart';
import 'screens/home_screen.dart';
import 'services/location_service.dart';
import 'services/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LocationService locationService = LocationService();
  final WeatherService weatherService = WeatherService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              LocationProvider(locationService: locationService),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(weatherService: weatherService),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
