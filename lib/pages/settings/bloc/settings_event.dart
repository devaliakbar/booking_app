part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsLoadEvent extends SettingsEvent {
  @override
  List<Object> get props => [];
}
