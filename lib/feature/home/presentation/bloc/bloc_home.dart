
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_magnum/feature/home/presentation/bloc/state_home.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitial());
  int index = 0;

  changePage(int newIndex) {
    emit(HomeLoading());
    index = newIndex;
    emit(HomePageChanged(newIndex));
  }
  
}