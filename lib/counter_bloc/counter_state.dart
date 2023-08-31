part of 'counter_bloc.dart';

@immutable
class CounterState extends Equatable {
  final int counterValue;

  const CounterState({required this.counterValue});

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return {'counterValue': counterValue};
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
    );
  }
}

class CounterInitial extends CounterState {
  const CounterInitial({required super.counterValue});
}

class IncrementValueState extends CounterState {
  const IncrementValueState({required super.counterValue});
}

class DecrementValueState extends CounterState {
  const DecrementValueState({required super.counterValue});
}
