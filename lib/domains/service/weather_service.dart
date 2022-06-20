// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ptolemay_demo/data/api/api_client.dart';
import 'package:ptolemay_demo/domains/models/weahter_model.dart';

class WeatherService {
  static Future<WeahterModel> fetchWeather(double lat, double lon) async {
    final response = await ApiClient()
        .dio
        .get('?lat=${lat}&lon=$lon&appid=${ApiClient.apiKey}&units=metric');
    return WeahterModel.fromJson(response.data);
  }
}
