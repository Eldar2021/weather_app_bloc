import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/bloc/internet_bloc/internet_bloc.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc/weather_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rest Weather data"),
      ),
      body: Column(
        children: [
          BlocConsumer<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetConnected) {
                return Container();
              }
              if (state is InternetDisConnected) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 7, bottom: 7),
                  decoration:const  BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Center(child: Text("Интернет байланышында ката бар")),
                );
              } else {
                return  Container();
              }
            },
            listener: (context, state) async{
              // if(state is InternetConnected){
              //   print("eldar");
              // }else{
              //   print("kamelia");
              // }
            },
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.cityName),
                      const CircularProgressIndicator(),
                    ],
                  ),
                );
              }
              if (state is WeatherSuccess) {
                return Center(
                  child: Column(
                    children: [
                      Image.network(
                        state.weatherModel.icon!,
                        width: MediaQuery.of(context).size.width * 0.7,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("error"),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
