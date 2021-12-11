part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetConnected extends InternetState{}

class InternetDisConnected extends InternetState{}
