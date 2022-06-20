import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_demo/domains/service/location_service.dart';
import 'package:ptolemay_demo/domains/service/weather_service.dart';

import '../../models/weahter_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  void getWeather() async {
    emit(WeatherLoading());
    try {
      final position = await LocationService.determinePosition();
      final data = await WeatherService.fetchWeather(
          position.latitude, position.longitude);
      emit(WeatherSuccess(data));
    } catch (e) {
      emit(WeatherError('Error, please try again later'));
    }
  }
}
