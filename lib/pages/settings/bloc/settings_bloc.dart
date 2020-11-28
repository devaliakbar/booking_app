import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookingapp/pages/settings/bloc/data/settings_model.dart';
import 'package:bookingapp/pages/settings/bloc/data/settings_repo.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepo settingsRepo;
  SettingsBloc(this.settingsRepo);

  @override
  SettingsState get initialState => SettingsLoadingState();

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsLoadEvent) {
      yield SettingsLoadingState();

      try {
        SettingsModel settingsPageData = await settingsRepo.getSettingsDatas();
        yield SettingsLoadedState(settingsPageData: settingsPageData);
      } catch (e) {
        yield SettingsFailedState(errorMsg: e.toString());
      }
    }
  }
}
