import 'package:flutter/material.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(cityName),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
