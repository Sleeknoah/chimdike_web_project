part of 'web_bloc.dart';

class WebEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ToggleThemeEvent implements WebEvent {
  final ThemeData currentTheme;

  ToggleThemeEvent(this.currentTheme);

  @override
  List<Object?> get props => [
        currentTheme,
      ];

  @override
  bool? get stringify => false;
}
