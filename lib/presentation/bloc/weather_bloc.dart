import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_weather_app/presentation/bloc/weather_event.dart';
import 'package:mr_weather_app/presentation/bloc/weather_state.dart';
import '../../data/repositories/weather_repository.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());

      try {
        final weather = await weatherRepository.fetchWeather(event.query);
        emit(WeatherLoaded(weather: weather));
      } catch (e) {
        emit(WeatherError(errorMessage: e.toString()));
      }
    });
  }
}
