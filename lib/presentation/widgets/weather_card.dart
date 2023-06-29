import 'package:flutter/material.dart';

import '../../data/model/weather_model.dart';



class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Image.network(
              'https://openweathermap.org/img/w/${weather.weatherData[0].icon}.png',
              width: 100.0,
              height: 100.0,alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8.0),
            Text(
              '${weather.main.temp}°C',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Weather: ${weather.weatherData[0].description}',
              style: const TextStyle(fontSize: 18.0),
            ),

          ],
        ),
      ),
    );
  }
}
