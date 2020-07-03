import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/home/bloc/data/home_model.dart';
import 'package:bookingapp/pages/home/bloc/data/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  HomeBloc(this.homeRepo);

  @override
  HomeState get initialState => HomeLoadingState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLoadEvent) {
      yield HomeLoadingState();

      try {
        HomePageDatas homePageDatas = await homeRepo.getHomePageDatas();
        yield HomeLoadedState(homePageDatas: homePageDatas);
      } catch (e) {
        yield HomeLoadingFailedState(errorMsg: e);
      }
    }
  }
}
