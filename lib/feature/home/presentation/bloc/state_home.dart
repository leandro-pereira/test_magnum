import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {}
class HomePageChanged extends HomeState {
  final int index;
  HomePageChanged(this.index);

  @override
  List<Object?> get props => [index];
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
