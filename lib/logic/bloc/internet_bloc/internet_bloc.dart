import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc(this.connectivity) : super(InternetInitial()) {
    _onListenInternetResult();
  }

  final Connectivity connectivity;

  StreamSubscription? streamSubscription;

  Future<StreamSubscription<ConnectivityResult>> _onListenInternetResult() async{
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        emit(InternetConnected());
      } else if (event == ConnectivityResult.mobile) {
        emit(InternetConnected());
      } else if (event == ConnectivityResult.none) {
        emit(InternetDisConnected());
      }
    });
  }
}
