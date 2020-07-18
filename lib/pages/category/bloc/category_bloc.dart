import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/category/bloc/data/category_model.dart';
import 'package:bookingapp/pages/category/bloc/data/category_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryBloc(this.categoryRepo);

  @override
  CategoryState get initialState => CategoryLoadingState();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is CategoryLoadEvent) {
      yield CategoryLoadingState();

      try {
        CategoryPageData categoryPageDatas =
            await categoryRepo.getCategoryPageDatas();
        yield CategoryLoadedState(categoryPageDatas: categoryPageDatas);
      } catch (e) {
        yield CategoryLoadingFailedState(errorMsg: e);
      }
    }
  }
}
