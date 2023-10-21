# Flutter Weather App with MultiProvider

A comprehensive Flutter application showcasing the use of the Provider package along with multiple providers for state management in a real-world scenario.

## Features

- Multiple Providers using MultiProvider
- ChangeNotifierProvider for reactive state management
- Consumer for responsive UI updates

## Getting Started

To dive into the app:

1. **Clone the repository**:

   git clone https://github.com/oguzbasaran/flutter-weather-app-with-multiprovider.git

2. **Navigate to the cloned directory**:
   
   cd flutter-weather-app-with-multiprovider

3. **Install the dependencies**:

   flutter pub get

4. **Run the app**:
   
   flutter run

## API Usage

**Obtaining the Weather API Key**

For the app to fetch weather details, you'll require an API key from OpenWeatherMap:

1. **Register on OpenWeatherMap**:
   - Visit [OpenWeatherMap](https://openweathermap.org/) and sign up for a free account.

2. **Generate API Key**:
   - Once registered and logged in, navigate to the API keys tab and generate a new API key.

3. **Integrate API Key into the App**:
   - After obtaining your API key, place it appropriately in the app's configurations.

   **Just add here:**
   services/weather_service.dart
   
     final String apiKey = 'your_api_key';

## Built With

- [Flutter](https://flutter.dev/) - The premier UI toolkit for crafting natively compiled applications across various platforms from a single codebase.
- [Provider](https://pub.dev/packages/provider) - A predominant Flutter state management library, suitable for fine-tuned UI responsiveness and code maintainability.

## Contribution

Pull requests are highly appreciated. If you have significant changes in mind, kindly open an issue first to discuss your intended modifications.

## License

This project is granted under the MIT License.

## Acknowledgments

- Immense gratitude to the Flutter team for their robust and expansive documentation.
- A big shoutout to all the open-source contributors whose endeavors amplify the joy of development.
