import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_bloc/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/data/weather/weather_model/weather_model.dart';

class WeatherSuccessWidget extends StatelessWidget {
  const WeatherSuccessWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      weather.name,
                      style: textTheme.headline3,
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      "${weather.temp.toStringAsFixed(1)}℃",
                      style: textTheme.headline3,
                    ),
                    const SizedBox(height: 40.0),
                    Text(
                      "Today",
                      style: textTheme.headline3,
                    ),
                    Text(
                      DateFormat('EEEEE, MMM dd', 'en_US').format(
                        DateTime.now(),
                      ),
                      style: textTheme.headline6,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "${weather.main}",
                      style: textTheme.headline5,
                    ),
                    Image.network(
                      weather.icon!,
                      width: 140.sp,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      " feeling  ${weather.feelsLike?.toStringAsFixed(1)}℃",
                      style: textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speed wind",
                      style: textTheme.headline5,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.wind,
                          width: 30.sp,
                        ),
                        const SizedBox(width: 7.0),
                        Text(
                          "${weather.speedWind}",
                          style: textTheme.headline5,
                        )
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Text(
                      "max ${weather.tempMax?.toStringAsFixed(1)}℃",
                      style: textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Text(
                "min  ${weather.tempMin?.toStringAsFixed(1)}℃",
                style: textTheme.headline5,
                textAlign: TextAlign.right,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
