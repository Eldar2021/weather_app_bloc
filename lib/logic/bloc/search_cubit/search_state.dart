part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  const SearchState() : super();
}

class SearchSuccess extends SearchState {
  final List<RegionModel> modelList;

  const SearchSuccess({
    required this.modelList,
  }) : super();
}

class SearchInitial extends SearchState {
  final List<RegionModel> modelList;

  const SearchInitial({
    required this.modelList,
  }) : super();
}

class SearchError extends SearchState {}

class SearchLoaded extends SearchState{}
