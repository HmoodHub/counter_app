import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter/counter_bloc/counter_imports.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(counterValue: 0)) {
    on<IncrementValue>((event, emit) {
      // TODO: implement event handler
      emit(IncrementValueState(counterValue: state.counterValue + 1));
    });
    on<DecrementValue>((event, emit) {
      // TODO: implement event handler
      emit(DecrementValueState(counterValue: state.counterValue - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
   return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
