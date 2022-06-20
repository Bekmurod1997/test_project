import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_demo/domains/bloc/theme/theme_cubit.dart';

import 'package:ptolemay_demo/ui/counter_screen.dart';
import 'package:ptolemay_demo/ui/widgets/darkmode.dart';

import '../domains/bloc/theme/theme_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.isDark ? ThemeData.dark() : ThemeData.light(),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    final size = MediaQuery.of(context).size;
    final circleOffset = Offset(-size.width + 20, size.height + 20);
    return DarkTransition(
      childBuilder: (context, x) =>
          const CounterScreen(title: 'Flutter Demo Home Page'),
      offset: circleOffset,
      isDark: theme.isDark,
    );
  }
}
