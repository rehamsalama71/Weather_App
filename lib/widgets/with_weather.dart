import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/main.dart';

import 'package:weather_appp/models/weather_model.dart';

class WithWeather extends StatelessWidget {
  const WithWeather({
    Key? key,required this.weather,
  }): super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
        getThemeColor(weatherModel.weatherCon)[400]!,
        getThemeColor(weatherModel.weatherCon)[300]!,
        getThemeColor(weatherModel.weatherCon)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Updated At ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   if (weatherModel.image.contains('https:'))
                Image.network(
                  weatherModel.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              else
                Image.network(
                  'https:${weatherModel.image}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'MaxTamp :${weatherModel.maxTemp.round()}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        'MinTamp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  
                ],
                
              ),
               SizedBox(
                    height: 33,
                  ),
                  Text(
                    weatherModel.weatherCon,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
