part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final HomePageDatas homePageDatas;
  HomeLoadedState({this.homePageDatas});

  @override
  List<Object> get props => [homePageDatas];
}

class HomeLoadingFailedState extends HomeState {
  final String errorMsg;
  HomeLoadingFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
