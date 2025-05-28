import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappflutter/data/dio/weatherrepository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  FindLocation({required String? cityname}) async {
    emit(WeatherLoading());
    final weatherRepository = WeatherRepository();
    weatherRepository.fetchWeather(cityName: cityname ?? '');
  }
}
