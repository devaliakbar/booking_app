import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/wiidgets/search_interface/bloc/data/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepo searchRepo;
  SearchBloc(this.searchRepo);

  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchQuery) {
      yield SearchLoading();
      try {
        List<String> searchResult =
            await searchRepo.getSearchResults(event.query);
        yield SearchLoaded(result: searchResult);
      } catch (e) {
        yield SearchError(errorMsg: e);
      }
    }
  }
}
