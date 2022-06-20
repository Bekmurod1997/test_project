import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_demo/domains/bloc/counter/counter_cubit.dart';
import 'package:ptolemay_demo/domains/bloc/theme/theme_cubit.dart';
import 'package:ptolemay_demo/domains/bloc/weather/weather_cubit.dart';

import 'package:ptolemay_demo/ui/app.dart';

void main() {
  final ThemeCubit theme = ThemeCubit();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => theme,
      ),
      BlocProvider(
        create: (context) => CounterCubit(theme),
      ),
      BlocProvider(
        create: (context) => WeatherCubit(),
      ),
    ],
    child: const App(),
  ));
}
