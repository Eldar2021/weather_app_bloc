part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class InternetListenEvent extends InternetEvent {}

class RefreshInternetListenEvent extends InternetEvent {}
