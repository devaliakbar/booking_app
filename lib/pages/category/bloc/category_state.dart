part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final CategoryPageData categoryPageDatas;
  CategoryLoadedState({this.categoryPageDatas});

  @override
  List<Object> get props => [categoryPageDatas];
}

class CategoryLoadingFailedState extends CategoryState {
  final String errorMsg;
  CategoryLoadingFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
