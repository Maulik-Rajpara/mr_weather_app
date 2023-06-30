import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mr_weather_app/presentation/pages/splash_page.dart';
import 'constant/api_constant.dart';
import 'data/repositories/weather_repository.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'presentation/pages/weather_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepository(ApiConstant.apiKey));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}
