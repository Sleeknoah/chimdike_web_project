import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'web_event.dart';
part 'web_state.dart';

class WebBloc extends Bloc<WebEvent, WebState> {
  WebBloc()
      : super(
          ToggleThemeState(
            ThemeData.light(),
          ),
        ) {
    on<ToggleThemeEvent>((event, emit) async {
      await _toggleTheme(event, emit);
    });
  }

  Future<void> _toggleTheme(
      ToggleThemeEvent event, Emitter<WebState> emit) async {
    if (event.currentTheme == ThemeData.light()) {
      emit(ToggleThemeState(ThemeData.dark()));
    } else {
      emit(ToggleThemeState(ThemeData.light()));
    }
  }
}
