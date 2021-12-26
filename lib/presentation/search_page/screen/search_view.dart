import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bloc/weather_bloc/weather_bloc.dart';
import '/logic/bloc/search_cubit/search_cubit.dart';
import '../widget/search_list_builder.dart';
import '../widget/search_load.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        height: MediaQuery.of(context).size.height * 0.90,
        child: Scaffold(
          appBar: _buildAppBar(context),
          backgroundColor: Colors.transparent,
          body: _buildBody(context),
        ),
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        buildBlocBuilder(),
        _elevatedButton(context, "search"),
      ],
    );
  }

  ElevatedButton _elevatedButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          context.read<WeatherBloc>().add(FetchWeatherEventByName(
                cityName: _controller.text,
              ));
          Navigator.pop(context);
        }
      },
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Text(text),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // title: Autocomplete<RegionModel>(
      //   optionsBuilder: (options) {
      //     // debugPrint(options.text);
      //     if (options.text.isEmpty || options.text == "") {
      //       return [];
      //     }
      //     return regions.where((e) {
      //       return e.enName.toLowerCase().contains(options.text.toLowerCase());
      //     });
      //   },
      //   displayStringForOption: (region) => region.enName,
      // ),
      title: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter city name',
        ),
        controller: _controller,
        onChanged: (val) {
          context.read<SearchCubit>().onSearch(val);
        },
        validator: (val) {
          if (val!.isEmpty) {
            return "required this is form";
          } else {
            return null;
          }
        },
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: _elevatedButton(context, "ok"),
      ),
    );
  }

  BlocBuilder<SearchCubit, SearchState> buildBlocBuilder() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return RegionListBuilder(
            list: state.modelList,
            selected: (region) {
              context.read<WeatherBloc>().add(
                    FetchWeatherEventByLat(
                      lat: region.lat,
                      long: region.lon,
                    ),
                  );
              Navigator.pop(context);
            },
          );
        } else if (state is SearchLoaded) {
          return const SearchLoad();
        } else if (state is SearchSuccess) {
          return RegionListBuilder(
            list: state.modelList,
            selected: (region) {
              context.read<WeatherBloc>().add(
                    FetchWeatherEventByLat(
                      lat: region.lat,
                      long: region.lon,
                    ),
                  );
              Navigator.pop(context);
            },
          );
        } else if (state is SearchError) {
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
