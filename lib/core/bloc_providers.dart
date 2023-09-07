import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/presentation/bloc/web_bloc.dart';

var blocProviders = [
  BlocProvider<WebBloc>(
    create: (context) => WebBloc(),
  ),
];
