import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '/data/cyrill/cyrill.dart';
import '/data/kg_region/region_model.dart';
import '/data/kg_region/regions.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial(modelList: regions));

  void onSearch(String text) {
    if (text.isNotEmpty) {
      emit(SearchLoaded());
      if (cyrill
          .where(
              (element) => element.toLowerCase().contains(text.toLowerCase()))
          .isNotEmpty) {
        List<RegionModel> regionList = regions
            .where((region) => region.kgName.toLowerCase().contains(
                  text.toLowerCase(),
                ))
            .toList();
        if (regionList.isNotEmpty) {
          emit(SearchSuccess(modelList: regionList));
        } else {
          emit(SearchError());
        }
      } else {
        List<RegionModel> regionList = regions
            .where((region) => region.enName.toLowerCase().contains(
                  text.toLowerCase(),
                ))
            .toList();
        if (regionList.isNotEmpty) {
          emit(SearchSuccess(modelList: regionList));
        } else {
          emit(SearchError());
        }
      }
    }
  }
}
