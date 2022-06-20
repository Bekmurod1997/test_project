part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeahterModel data;

  WeatherSuccess(this.data);
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);
}
