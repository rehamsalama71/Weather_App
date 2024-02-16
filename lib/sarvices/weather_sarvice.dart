import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_appp/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c576ef3b054549f99fb152854241402';
  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'Try Later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Try Again Later');
    }
  }
}
