part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  final String errorMsg;
  SearchError({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<String> result;
  SearchLoaded({this.result});

  @override
  List<Object> get props => [result];
}
