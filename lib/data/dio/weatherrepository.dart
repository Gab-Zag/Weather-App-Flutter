import 'package:dio/dio.dart';
import 'package:weatherappflutter/models/weather_model.dart';

class WeatherRepository {
  Future<List<WeatherModel>> fetchWeather({required String cityName}) async {
    final Dio dio = Dio();

    Response response = await dio.get(
      "http://api.openweathermap.org/data/2.5/forecast?id=524901&appid={e1e2c29b51f2e62ca06da831f34e2ebf}",
      queryParameters: {'q': cityName, 'units': 'metric', 'lang': 'pt_br'},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['list'];
      return data.map((item) => WeatherModel.fromJson(item)).toList();
    } else {
      throw Exception(
        'Falha ao carregar os dados do clima: ${response.statusCode}',
      );
    }
  }
}
