import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ptolemay_demo/domains/bloc/theme/theme_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(this.theme)
      : super(CounterState(
            counterValue: 0, isMinusHidden: true, isPlusHidden: false));
  final ThemeCubit theme;

  void increment() {
    if (state.counterValue > 9) {
      emit(CounterState(
          counterValue: 10, isMinusHidden: false, isPlusHidden: true));
    }

    // if (state.counterValue == 10) {
    //   emit(CounterState(
    //       counterValue: 10, isMinusHidden: false, isPlusHidden: true));
    //   return;
    // }

    if (theme.isDark) {
      emit(
        CounterState(
          counterValue:
              state.counterValue + 2 > 10 ? 10 : state.counterValue + 2,
          isMinusHidden: false,
          isPlusHidden: state.counterValue >= 8,
        ),
      );
    } else {
      emit(CounterState(
          counterValue: state.counterValue + 1,
          isMinusHidden: false,
          isPlusHidden: state.counterValue >= 9));
    }
  }

  void decrement() {
    if (state.counterValue <= 2) {
      emit(CounterState(
          counterValue: 0, isMinusHidden: true, isPlusHidden: false));
      return;
    }
    if (theme.isDark) {
      emit(CounterState(
          counterValue: state.counterValue - 2,
          isMinusHidden: state.counterValue < 2,
          isPlusHidden: false));
    } else {
      emit(CounterState(
          counterValue: state.counterValue - 1,
          isMinusHidden: false,
          isPlusHidden: false));
    }
  }

  // void increment() => emit(CounterState(counterValue: state.counterValue + 1));
  // void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}
