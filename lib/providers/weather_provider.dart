import 'package:flutter/foundation.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService weatherService;
  Weather? _weather;

  WeatherProvider({required this.weatherService});

  Weather? get weather => _weather;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getWeather(double latitude, double longitude) async {
    _isLoading = true;
    notifyListeners();
    try {
      _weather = await weatherService.getWeather(latitude, longitude);
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<Weather?> get getWeatherFuture async {
    return _weather;
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
