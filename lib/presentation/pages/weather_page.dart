import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../bloc/weather_event.dart';
import '../bloc/weather_state.dart';
import '../widgets/weather_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: locationController,
              decoration: const InputDecoration(labelText: 'Enter Location'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final location = locationController.text;
              weatherBloc.add(FetchWeather(query: location));
            },
            child: const Text('Get Weather'),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const CircularProgressIndicator();
              } else if (state is WeatherLoaded) {
                final weather = state.weather;
                return WeatherCard(weather: weather);
              } else if (state is WeatherError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error: ${state.errorMessage}'),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
