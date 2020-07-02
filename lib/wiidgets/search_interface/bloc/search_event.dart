part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchQuery extends SearchEvent {
  final String query;

  SearchQuery(this.query);

  @override
  List<Object> get props => [query];
}
