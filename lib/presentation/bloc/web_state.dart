part of 'web_bloc.dart';

class WebState extends Equatable {
  final ThemeData themeData;

  const WebState(this.themeData);

  @override
  List<Object?> get props => [
        themeData,
      ];
}

class ToggleThemeState extends WebState {
  const ToggleThemeState(super.themeData);
}
