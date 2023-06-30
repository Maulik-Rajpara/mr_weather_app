import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constant/api_constant.dart';
import '../model/weather_model.dart';



class WeatherRepository {
  final String apiKey;
  final String baseUrl = ApiConstant.baseURL;

  WeatherRepository(this.apiKey);

  Future<WeatherModel> fetchWeather(String query) async {
    final url = Uri.parse('$baseUrl?q=$query&appid=$apiKey&units=metric');
    final response = await http.get(url);

    print("response.body ${response.body} ${response.statusCode}");
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return WeatherModel.fromJson(jsonData);
    } else {
      if(response.statusCode==404){
        final jsonData = jsonDecode(response.body);
        throw Exception(jsonData['message']);
      }
      throw Exception('Failed to fetch weather data');
    }
  }
}
