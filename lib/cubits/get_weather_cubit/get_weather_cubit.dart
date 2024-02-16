import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_appp/models/weather_model.dart';
import 'package:weather_appp/sarvices/weather_sarvice.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
   WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());
  getWeather({required String cityName}) async {
    try {
     weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
