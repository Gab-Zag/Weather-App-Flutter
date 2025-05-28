import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherappflutter/cubit/weather_cubit.dart';
import 'package:weatherappflutter/cubit/weather_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherCubit _cubit = WeatherCubit();

  @override
  void initState() {
    super.initState();
    _cubit = WeatherCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('testes')),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: _cubit,
        builder: (_, state) {
          return Center(
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _cubit.FindLocation(cityname: 'santa rita do sapucai');
              },
            ),
          );
        },
      ),
    );
  }
}
