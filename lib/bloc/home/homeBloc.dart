import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/home/homeState.dart';
import 'package:ulearning/bloc/home/home_event.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {

HomeBloc():super(HomeState()){
on<HomeDots>(_homePagedots);
}
void _homePagedots(HomeDots event ,Emitter<HomeState>emit){
  emit(state.copywith(index: event.index));
}

}