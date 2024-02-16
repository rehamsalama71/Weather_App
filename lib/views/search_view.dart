
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherModel = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherModel.getWeather(cityName: value);
              Navigator.of(context).pop();
            
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                labelText: 'Search',
                suffixIcon: const Icon(Icons.search),
                hintText: 'Enter City',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ))),
          ),
        ),
      ),
    );
  }
}
