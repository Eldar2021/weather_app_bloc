import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bloc/search_cubit/search_cubit.dart';
import 'screen/search_view.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: SearchView(),
    );
  }
}
