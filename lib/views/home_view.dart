import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_appp/widgets/with_weather.dart';
import '../../widgets/without_weather.dart';
import 'search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return WithoutWeather();
          } else if (state is WeatherLoadedState) {
            return WithWeather(
              weather:state.weatherModel,
             );
          } else {
            return Text(' Error');
          }
        },
      ),
    );
  }
}
