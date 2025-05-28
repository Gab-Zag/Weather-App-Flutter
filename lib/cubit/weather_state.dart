import 'package:equatable/equatable.dart';
import 'package:weatherappflutter/models/weather_model.dart';

abstract class WeatherState extends Equatable {
  final bool isLoading;
  final List<WeatherModel> weather;

  const WeatherState({
    this.isLoading = false,
    this.weather = const [],
  });

  WeatherState copyWith({
    bool? isLoading,
    List<WeatherModel>? weather,
  });

  @override
  List<Object?> get props => [
    isLoading,
    weather,
  ];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial({bool isLoading = false, List<WeatherModel> weather = const []})
      : super(isLoading: isLoading, weather: weather);

  @override
  WeatherInitial copyWith({
    bool? isLoading,
    List<WeatherModel>? weather,
  }) {
    return WeatherInitial(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}

class WeatherLoading extends WeatherState {
  const WeatherLoading({bool isLoading = true, List<WeatherModel> weather = const []})
      : super(isLoading: isLoading, weather: weather);

  @override
  WeatherLoading copyWith({
    bool? isLoading,
    List<WeatherModel>? weather,
  }) {
    return WeatherLoading(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({bool isLoading = false, required List<WeatherModel> weather})
      : super(isLoading: isLoading, weather: weather);

  @override
  WeatherLoaded copyWith({
    bool? isLoading,
    List<WeatherModel>? weather,
  }) {
    return WeatherLoaded(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}

class WeatherError extends WeatherState {
  final String message;
  const WeatherError({required this.message, bool isLoading = false, List<WeatherModel> weather = const []})
      : super(isLoading: isLoading, weather: weather);

  @override
  WeatherError copyWith({
    bool? isLoading,
    List<WeatherModel>? weather,
    String? message,
  }) {
    return WeatherError(
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [isLoading, weather, message];
}
