part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool isPlusHidden;

  bool isMinusHidden;
  CounterState(
      {required this.counterValue,
      required this.isMinusHidden,
      required this.isPlusHidden});
}
