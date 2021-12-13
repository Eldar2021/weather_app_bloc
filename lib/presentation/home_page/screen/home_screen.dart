import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/service/bottom_search.dart';
import '/presentation/components/snack_bar.dart';
import '../widgets/internet_dis_connected_widget.dart';
import '/logic/bloc/internet_bloc/internet_bloc.dart';
import '/generated/assets.dart';
import '/logic/bloc/weather_bloc/weather_bloc.dart';
import '../widgets/weather_error_widget.dart';
import '../widgets/weather_loading_widget.dart';
import '../widgets/weather_success_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.88,
          ),
          child: _buildBody(context),
        ),
      ),
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 7, right: 7),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        colorFilter: ColorFilter.mode(
          const Color(0xff000000).withOpacity(0.8),
          BlendMode.dstATop,
        ),
        image: const AssetImage(Assets.imagesBg),
        fit: BoxFit.contain,
      )),
      child: Column(
        children: [
          buildBlocConsumer(),
          buildBlocBuilder(),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text("Weather"),
      actions: [
        IconButton(
          onPressed: () {
            Search.sourceBottomSheetRespond(context);
          },
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  BlocConsumer<dynamic, dynamic> buildBlocConsumer() {
    return BlocConsumer<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetDisConnected) {
          return const InterNetDisConnectedWidget();
        } else {
          return Container();
        }
      },
      listener: (context, state) {
        if (state is InternetDisConnected) {
          MySnackBar.customSnackBarError(context, "you are have not internet");
        } else {}
      },
    );
  }

  BlocBuilder<WeatherBloc, WeatherState> buildBlocBuilder() {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoaded) {
          return WeatherLoadingWidget(cityName: state.cityName);
        } else if (state is WeatherSuccess) {
          return WeatherSuccessWidget(weather: state.weatherModel);
        } else if (state is WeatherError) {
          return WeatherErrorWidget(error: state.error);
        } else {
          return const WeatherErrorWidget(error: "Error is documentation");
        }
      },
    );
  }
}
