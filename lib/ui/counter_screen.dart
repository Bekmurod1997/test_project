import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptolemay_demo/domains/bloc/counter/counter_cubit.dart';
import 'package:ptolemay_demo/domains/bloc/theme/theme_cubit.dart';
import 'package:ptolemay_demo/domains/bloc/weather/weather_cubit.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = context.watch<ThemeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is WeatherError) {
                  return Text(state.error);
                }

                if (state is WeatherSuccess) {
                  final city = state.data.name;
                  final country = state.data.sys?.country;
                  final temp = state.data.main?.temp;
                  final fahrenheit = ((temp! * 9 / 5) + 32).toStringAsFixed(1);
                  return Text(
                    'Weather for $city of $country\n$city: ${temp.toStringAsFixed(1)} °C ($fahrenheit°F)',
                  );
                }

                return const Text(
                  'Press the icon to get your location',
                );
              },
            ),
            const SizedBox(height: 40.0),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: context.read<WeatherCubit>().getWeather,
                  child: const Icon(Icons.cloud),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    theme.changeTheme();
                  },
                  child: const Icon(Icons.draw_outlined),
                ),
              ],
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    state.isPlusHidden
                        ? const SizedBox(height: 56)
                        : FloatingActionButton(
                            onPressed: () {
                              context.read<CounterCubit>().increment();
                            },
                            child: const Icon(Icons.add),
                          ),
                    const SizedBox(height: 20),
                    state.isMinusHidden
                        ? const SizedBox(height: 56)
                        : FloatingActionButton(
                            onPressed: () {
                              context.read<CounterCubit>().decrement();
                            },
                            child: const Icon(Icons.remove),
                          ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
