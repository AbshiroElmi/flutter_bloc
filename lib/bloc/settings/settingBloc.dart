import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/bloc/settings/seetingState.dart';
import 'package:ulearning/bloc/settings/settingsEvent.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<TrigerSettings>(_trigetSettings);
  }
  void _trigetSettings(SettingEvent event, Emitter<SettingState> emit) {
    emit(SettingState());
  }
}
