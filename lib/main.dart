import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/core/app_colors.dart';
import 'package:web_project/core/bloc_providers.dart';
import 'package:web_project/presentation/bloc/web_bloc.dart';

import 'presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: BlocConsumer<WebBloc, WebState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Chimdike Nnacheta',
            debugShowCheckedModeBanner: false,
            theme: state.themeData.copyWith(
              useMaterial3: true,
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                  fontSize: 250,
                  fontWeight: FontWeight.bold,
                  color: state.themeData == ThemeData.light()
                      ? AppColors.welcomeColorLight
                      : AppColors.welcomeColorDark,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: state.themeData == ThemeData.light()
                      ? AppColors.appBarColorDark
                      : AppColors.appBarColorLight,
                ),
                bodySmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: state.themeData == ThemeData.light()
                      ? AppColors.appBarColorDark
                      : AppColors.appBarColorLight,
                ),
              ),
            ),
            home: const HomePage(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
