part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsLoadingState extends SettingsState {
  @override
  List<Object> get props => [];
}

class SettingsLoadedState extends SettingsState {
  final SettingsModel settingsPageData;
  SettingsLoadedState({this.settingsPageData});

  @override
  List<Object> get props => [settingsPageData];
}

class SettingsFailedState extends SettingsState {
  final String errorMsg;
  SettingsFailedState({this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
