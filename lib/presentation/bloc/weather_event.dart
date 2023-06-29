import 'package:equatable/equatable.dart';


abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String query;

  const FetchWeather({required this.query});

  @override
  List<Object> get props => [query];
}
