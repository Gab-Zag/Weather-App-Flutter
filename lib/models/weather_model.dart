class WeatherModel {
  final String? cityName;
  final double? temperature;
  final String? decription;
  final String? icon;
  
  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.decription,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      temperature: json['main']['temp'].toDouble(),
      decription: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      cityName: json['name'],
    );
  }
}