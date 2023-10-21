import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../providers/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Consumer2<LocationProvider, WeatherProvider>(
        builder: (context, locationProvider, weatherProvider, child) {
          if (weatherProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    weatherProvider.setLoading(true);
                    locationProvider.getCurrentLocation().then((locationData) {
                      if (locationData != null &&
                          locationData.latitude != null &&
                          locationData.longitude != null) {
                        weatherProvider.getWeather(
                            locationData.latitude!, locationData.longitude!);
                      } else {
                        weatherProvider.setLoading(false);
                      }
                    }).catchError((error) {
                      weatherProvider.setLoading(false);
                      print('An error occurred: $error');
                    });
                  },
                  child: const Text('Get Current Location'),
                ),
                weatherProvider.weather != null
                    ? Column(
                        children: <Widget>[
                          Text(
                            'Temperature: ${weatherProvider.weather!.temperature}°C',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Description: ${weatherProvider.weather!.description}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Image.network(
                            'http://openweathermap.org/img/w/${weatherProvider.weather!.icon}.png',
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
