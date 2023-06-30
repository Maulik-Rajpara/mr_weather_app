import 'package:flutter/material.dart';

import '../../data/model/weather_model.dart';
import '../../utils/date_time_converter.dart';



class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  WeatherCard({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            Image.network(
              'https://openweathermap.org/img/w/${weather.weatherData![0].icon}.png',
              width: 100.0,
              height: 100.0,alignment: Alignment.center,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8.0),
            Text(
              '${weather.main!.temp}°C',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            weatherData('Location',weather.name),
            weatherData('Weather',weather.weatherData![0].description),
            weatherData('Humidity',weather.main!.humidity.toString()),
            weatherData('Pressure',weather.main!.pressure.toString()),
            weatherData('Latitude',weather.coordinates!.lat.toString()),
            weatherData('Longitude',weather.coordinates!.lon.toString()),
            weatherData('Sunrise',
                DateTimeConverter().timestampToDateTimeString(
                  weather.sys!.sunrise.toInt()
                )),
            weatherData('Sunset',
                DateTimeConverter().timestampToDateTimeString(
                    weather.sys!.sunset.toInt()
                )),

          ],
        ),
      ),
    );
  }


  Widget weatherData(String? weatherLabel,String? data){
    return  Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(weatherLabel!,style: TextStyle(
            fontSize: 16,
          ),),
          Text(data!??'-',style: TextStyle(
            fontSize: 16,
          ),),


        ],
      ),
    );
  }


}
