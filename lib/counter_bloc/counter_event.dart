part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementValue extends CounterEvent {}
class DecrementValue extends CounterEvent {}
