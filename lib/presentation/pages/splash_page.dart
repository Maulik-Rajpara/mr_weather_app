import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:mr_weather_app/presentation/pages/weather_page.dart';



import '../../data/repositories/weather_repository.dart';
import '../bloc/weather_bloc.dart';
import '../widgets/splash_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectScreen(context);
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SplashWidget()));
  }

  void redirectScreen(context) async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BlocProvider(
        create: (context) =>
            WeatherBloc(weatherRepository: GetIt.instance<WeatherRepository>(),
       ),child: const WeatherPage(),)));
  }
}
